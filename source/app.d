import std.stdio;

import forge;
import compute_copy;

import core.stdc.math;

static const float XMIN = -32.0f;
static const float XMAX = 32.0f;
static const float YMIN = -32.0f;
static const float YMAX = 32.0f;

const float DX     = 0.25;
const size_t XSIZE = cast(size_t)((XMAX - XMIN) / DX);
const size_t YSIZE = cast(size_t)((YMAX - YMIN) / DX);

void genSurface(float dx, ref float[] vec) {
    vec.length = 196608;
    // printf("len: %g\n",  ((XMAX - XMIN) / dx) * ((YMAX - YMIN) / dx) * 3);
   // ((XMAX - XMIN) / dx) * ((YMAX - YMIN) / dx) * 3
// cast(size_t)(XMAX*YMAX*3*2) + 3;
    size_t idx;

    for (float x = XMIN; x < XMAX; x += dx) {
        for (float y = YMIN; y < YMAX; y += dx) {
            vec[idx++] = (x);
            vec[idx++] = (y);
            float z = sqrt(x * x + y * y) + 2.2204e-16f;
            vec[idx++] = (sin(z) / z);
        }
    }
}


import plot3;

extern (C) uint glGetError();
extern (C) const (char)* glGetString(uint); 

void main()
{
/+
    fg_window wnd;
    (&wnd).fg_create_window(1920, 1080, "3d Surface Demo");
    wnd.fg_make_window_current();

    fg_chart chart;
    (&chart).fg_create_chart(fg_chart_type.FG_CHART_3D);

    chart.fg_set_chart_axes_limits(XMIN - 2.0f, XMAX + 2.0f, YMIN - 2.0f, YMAX + 2.0f,
                        -0.5, 1.);
    chart.fg_set_chart_axes_titles("x-axis", "y-axis", "z-axis");

    fg_surface surf;
    (&surf).fg_add_surface_to_chart(chart, XSIZE, YSIZE, fg_dtype.FG_FLOAT32, 
        fg_plot_type.FG_PLOT_SURFACE, fg_marker_type.FG_MARKER_NONE);

    surf.fg_set_surface_color(1, 1, 1, 0.5);

    // generate a surface
    float[] f;

    genSurface(DX, f);

    GfxHandle* handle;
    uint vert_buffer;
    uint vert_buffer_size;

    fg_get_surface_vertex_buffer(&vert_buffer, surf);
    fg_get_surface_vertex_buffer_size(&vert_buffer_size, surf);

    createGLBuffer(&handle, vert_buffer, BufferType.FORGE_VERTEX_BUFFER);

    /* copy your data into the pixel buffer object exposed by
     * forge::Plot class and then proceed to rendering.
     * To help the users with copying the data from compute
     * memory to display memory, Forge provides copy headers
     * along with the library to help with this task
     */
    copyToGLBuffer(handle, cast(ComputeResourceHandle)f,
                   vert_buffer_size);


    bool wnd_close = false;
    wnd.fg_draw_chart(chart);
    fg_save_window_framebuffer("test.png", wnd);
    char* msg;
    int len;
    fg_get_last_error(&msg, &len);
    if (msg)
    {
        printf("err: %s\n", msg);
    }

    do { wnd.fg_draw_chart(chart); fg_close_window(&wnd_close, wnd); } 
        while (!wnd_close);

    releaseGLBuffer(handle);
/+
    auto gl_err = glGetError();
    printf("gl_err: %s\n", glGetString(gl_err));
+/

   fg_release_window(wnd);
// TODO find out how to clean the context which seems to be screwed up.
// and that's why it won't draw if you uncomment the line below
+/
    plot3.plot3();

}
