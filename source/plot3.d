import forge;
import compute_copy;
import core.stdc.math;
import core.stdc.stdio;

const DIMX = 1000;
const DIMY = 800;

const float FRANGE_START = 0f;
const float FRANGE_END   = 2f * 3.1415926f;

extern (C) float dummy (float);

void map_range_to_vec_vbo(float range_start, float range_end, float dx,
                          ref float[] vec, typeof(&dummy) map) {
    if (range_start > range_end && dx > 0) return;
    size_t idx;

    const len = cast(size_t) (((((range_end - range_start) + 1) / dx) * 2) + 1);
    vec.length = len;
    for (float i = range_start; i < range_end; i += dx) {
        vec[idx++] = (i);
        vec[idx++] = ((*map)(i));
    }

    vec = vec[0 .. idx];
}

void setColor(fg_plot plot, uint rgba)
{
    uint r255 = (rgba >> 24) & 0xFF;
    uint g255 = (rgba >> 16) & 0xFF;
    uint b255 = (rgba >> 8)  & 0xFF;
    uint a255 = (rgba >> 0)  & 0xFF;

    float r = r255 / 255f;
    float g = g255 / 255f;
    float b = b255 / 255f;
    float a = a255 / 255f;

    fg_set_plot_color(plot, r, g, b, a);
}

int plot3() {
    import core.memory : GC;
    GC.disable();

    float[] sinData;
    float[] cosData;
    float[] tanData;
    float[] logData;
    map_range_to_vec_vbo(FRANGE_START, FRANGE_END, 0.1f, sinData, &sinf);
    map_range_to_vec_vbo(FRANGE_START, FRANGE_END, 0.1f, cosData, &cosf);
    map_range_to_vec_vbo(FRANGE_START, FRANGE_END, 0.1f, tanData, &tanf);
    map_range_to_vec_vbo(FRANGE_START, FRANGE_END, 0.1f, logData, &log10f);

    /*
     * First Forge call should be a window creation call
     * so that necessary OpenGL context is created for any
     * other forge::* object to be created successfully
     */
    fg_window wnd;
    (&wnd).fg_create_window(DIMX, DIMY, "Plotting Demo");
    wnd.fg_make_window_current();

    // forge::Window wnd(DIMX, DIMY, "Plotting Demo");
    // wnd.makeCurrent();

   fg_chart chart;
   (&chart).fg_create_chart(fg_chart_type.FG_CHART_2D);


    // forge::Chart chart(FG_CHART_2D);
    // chart.setAxesLimits(FRANGE_START, FRANGE_END, -1.0f, 1.0f);

    chart.fg_set_chart_axes_limits(FRANGE_START, FRANGE_END, -1.0f, 1.0f, 0, 0);

    char* msg;
    int len;
    fg_get_last_error(&msg, &len);
    if (msg)
    {
        printf("err: %s\n", msg);
    }

    /* Create several plot objects which creates the necessary
     * vertex buffer objects to hold the different plot types
     */
    fg_plot plt0;
    (&plt0).fg_add_plot_to_chart(chart, cast(uint)(sinData.length / 2), fg_dtype.FG_FLOAT32,
        fg_plot_type.FG_PLOT_LINE, fg_marker_type.FG_MARKER_NONE);
 // = chart.plot((unsigned)(sinData.size() / 2),
 //                                 forge::f32);  // create a default plot
    fg_plot plt1;
    (&plt1).fg_add_plot_to_chart(chart, cast(uint)(cosData.length / 2), fg_dtype.FG_FLOAT32,
        fg_plot_type.FG_PLOT_LINE, fg_marker_type.FG_MARKER_NONE);  // or specify a specific plot type

    fg_plot plt2;
    (&plt2).fg_add_plot_to_chart(chart, cast(uint)(tanData.length / 2), fg_dtype.FG_FLOAT32, 
        fg_plot_type.FG_PLOT_LINE, fg_marker_type.FG_MARKER_TRIANGLE);  // last parameter specifies marker shape

    fg_plot plt3;
    (&plt3).fg_add_plot_to_chart(chart, cast(uint)(logData.length / 2), fg_dtype.FG_FLOAT32,
        fg_plot_type.FG_PLOT_SCATTER, fg_marker_type.FG_MARKER_CROSS);

    /*
     * Set plot colors
     */

    enum FG_RED =       0xff_00_00_ff;
    enum FG_GREEN =       0x00_ff_00_ff;
    enum FG_BLUE =      0x00_00_ff_ff;
    enum FG_YELLOW =    FG_RED | FG_GREEN;

    plt0.setColor(FG_RED);
    plt1.setColor(FG_BLUE);
    plt2.setColor(FG_YELLOW);                 // use a forge predefined color
    plt3.setColor(0x257973FF);  // or any hex-valued color

    /*
     * Set plot legends
     */
    plt0.fg_set_plot_legend("Sine (red)");
    plt1.fg_set_plot_legend("Cosine (blue)");
    plt2.fg_set_plot_legend("Tangent (yellow)");
    plt3.fg_set_plot_legend("Log base 10");

    GfxHandle*[4] handles;
    uint plt0_vertices;
    uint plt1_vertices;
    uint plt2_vertices;
    uint plt3_vertices;

    uint plt0_verticesSize;
    uint plt1_verticesSize;
    uint plt2_verticesSize;
    uint plt3_verticesSize;

    fg_get_plot_vertex_buffer(&plt0_vertices, plt0);
    fg_get_plot_vertex_buffer_size(&plt0_verticesSize, plt0);

    fg_get_plot_vertex_buffer(&plt1_vertices, plt1);
    fg_get_plot_vertex_buffer_size(&plt1_verticesSize, plt1);

    fg_get_plot_vertex_buffer(&plt2_vertices, plt2);
    fg_get_plot_vertex_buffer_size(&plt2_verticesSize, plt2);

    fg_get_plot_vertex_buffer(&plt3_vertices, plt3);
    fg_get_plot_vertex_buffer_size(&plt3_verticesSize, plt3);


    createGLBuffer(&handles[0], plt0_vertices, BufferType.FORGE_VERTEX_BUFFER);
    createGLBuffer(&handles[1], plt1_vertices, BufferType.FORGE_VERTEX_BUFFER);
    createGLBuffer(&handles[2], plt2_vertices, BufferType.FORGE_VERTEX_BUFFER);
    createGLBuffer(&handles[3], plt3_vertices, BufferType.FORGE_VERTEX_BUFFER);

    /* copy your data into the pixel buffer object exposed by
     * forge::Plot class and then proceed to rendering.
     * To help the users with copying the data from compute
     * memory to display memory, Forge provides copy headers
     * along with the library to help with this task
     */
    copyToGLBuffer(handles[0], cast(ComputeResourceHandle)sinData,
                   plt0_verticesSize);
    copyToGLBuffer(handles[1], cast(ComputeResourceHandle)cosData,
                   plt1_verticesSize);
    copyToGLBuffer(handles[2], cast(ComputeResourceHandle)tanData,
                   plt2_verticesSize);
    copyToGLBuffer(handles[3], cast(ComputeResourceHandle)logData,
                   plt3_verticesSize);

fg_get_last_error(&msg, &len);
    if (msg)
    {
        printf("err: %s\n", msg);
    }


//    do { wnd.draw(chart); } while (!wnd.close());

    bool wnd_close = false;
    do { wnd.fg_draw_chart(chart); fg_close_window(&wnd_close, wnd); fg_get_last_error(&msg, &len);
    if (msg)
    {
        printf("err: %s\n", msg);
    }
}
        while (!wnd_close);


    releaseGLBuffer(handles[0]);
    releaseGLBuffer(handles[1]);
    releaseGLBuffer(handles[2]);
    releaseGLBuffer(handles[3]);

    return 0;
}
