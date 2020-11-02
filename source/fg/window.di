/*******************************************************
 * Copyright (c) 2015-2019, ArrayFire
 * All rights reserved.
 *
 * This file is distributed under 3-clause BSD license.
 * The complete license agreement can be obtained at:
 * http://arrayfire.com/licenses/BSD-3-Clause
 ********************************************************/

extern (C):

public import fg.defines;

/** \addtogroup win_functions
 * @{
 */

/**
   Create a Window object.

   \param[out] pWindow is set to the window created
   \param[in] pWidth Width of the display window
   \param[in] pHeight Height of the display window
   \param[in] pTitle window Title
   \param[in] pShareWindow is an already existing window with which the window to
              be created should share the rendering context.
   \param[in] pInvisible indicates if the window is created in invisible mode.

   \return \ref fg_err error code
 */
fg_err fg_create_window (
    fg_window* pWindow,
    const int pWidth,
    const int pHeight,
    const(char)* pTitle,
    const fg_window pShareWindow = null,
    const bool pInvisible = false);

/**
   Increment the internal reference count for Window

   \param[out] pOut is the new window handle pointing to existing window
   \param[in] pWindow is the original window handle

   \return \ref fg_err error code
 */
fg_err fg_retain_window (fg_window* pOut, fg_window pWindow);

/**
   Destroy Window Object

   Decrements the reference count to the shared window object.

   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_release_window (fg_window pWindow);

/**
   Set font object to be used by Window Object

   \param[in] pWindow is Window handle
   \param[in] pFont is Font handle

   \return \ref fg_err error code
 */
fg_err fg_set_window_font (fg_window pWindow, const fg_font pFont);

/**
   Set the title of Window Object

   \param[in] pWindow is Window handle
   \param[in] pTitle is the window tile

   \return \ref fg_err error code
 */
fg_err fg_set_window_title (fg_window pWindow, const(char)* pTitle);

/**
   Set the window origin of Window Object w.r.t screen origin

   \param[in] pWindow is Window handle
   \param[in] pX is the x coordinate of window top left corner
   \param[in] pY is the y coordinate of window top left corner

   \return \ref fg_err error code
 */
fg_err fg_set_window_position (fg_window pWindow, const int pX, const int pY);

/**
   Set the window dimensions of Window Object

   \param[in] pWindow is Window handle
   \param[in] pWidth is the width of window
   \param[in] pHeight is the height of window

   \return \ref fg_err error code
 */
fg_err fg_set_window_size (fg_window pWindow, const uint pWidth, const uint pHeight);

/**
   Set the colormap to be used by the Window Object

   \param[in] pWindow is Window handle
   \param[in] pColorMap takes one of the values of enum \ref fg_color_map

   \return \ref fg_err error code
 */
fg_err fg_set_window_colormap (fg_window pWindow, const fg_color_map pColorMap);

/**
   Get the backend specific context handle of Window

   \param[out] pContext is set to the backend specific context handle
   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_get_window_context_handle (long* pContext, const fg_window pWindow);

/**
   Get the display device handle of Window

   \param[out] pDisplay is set to the display device handle
   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_get_window_display_handle (long* pDisplay, const fg_window pWindow);

/**
   Get the width of Window

   \param[out] pWidth is set to the width of the Window
   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_get_window_width (int* pWidth, const fg_window pWindow);

/**
   Get the height of Window

   \param[out] pHeight is set to the height of the Window
   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_get_window_height (int* pHeight, const fg_window pWindow);

/**
   Make the window's backend specific context the active context in given thread

   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_make_window_current (const fg_window pWindow);

/**
   Hide the Window

   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_hide_window (const fg_window pWindow);

/**
   Show the Window

   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_show_window (const fg_window pWindow);

/**
   Check if the Window is closed

   \param[out] pIsClosed is set to boolean value if the window is closed
   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_close_window (bool* pIsClosed, const fg_window pWindow);

/**
   Render given image to Window

   \param[in] pWindow is Window handle
   \param[in] pImage is Image handle
   \param[in] pKeepAspectRatio is boolean indicating if the image aspect ratio has to be maintained while rendering the image

   \return \ref fg_err error code
 */
fg_err fg_draw_image (const fg_window pWindow, const fg_image pImage, const bool pKeepAspectRatio);

/**
   Render given chart to Window

   \param[in] pWindow is Window handle
   \param[in] pChart is chart handle

   \return \ref fg_err error code
 */
fg_err fg_draw_chart (const fg_window pWindow, const fg_chart pChart);

/**
   Render given image to Window's particular sub-view

   \param[in] pWindow is Window handle
   \param[in] pRows indicates the number of rows in grid layout
   \param[in] pCols indicates the number of columns in grid layout
   \param[in] pIndex indicates the index of cell in the layout represented by \p pRows and \p pCols
   \param[in] pImage is image handle
   \param[in] pTitle is the title of the sub-view
   \param[in] pKeepAspectRatio is boolean indicating if the image aspect ratio has to be maintained while rendering the image

   \return \ref fg_err error code

   \note this draw call doesn't automatically swap back buffer
   with front buffer (double buffering mechanism) since it doesn't have the
   knowledge of which sub-regions already got rendered. We should call
   fg_swap_window_buffers once all draw calls corresponding to all sub-regions are called
   when in multiview mode.
 */
fg_err fg_draw_image_to_cell (
    const fg_window pWindow,
    const int pRows,
    const int pCols,
    const int pIndex,
    const fg_image pImage,
    const(char)* pTitle,
    const bool pKeepAspectRatio);

/**
   Render given chart to Window's particular sub-view

   \param[in] pWindow is Window handle
   \param[in] pRows indicates the number of rows in grid layout
   \param[in] pCols indicates the number of columns in grid layout
   \param[in] pIndex indicates the index of cell in the layout represented by \p pRows and \p pCols
   \param[in] pChart is chart handle
   \param[in] pTitle is the title of the sub-view

   \return \ref fg_err error code

   \note this draw call doesn't automatically swap back buffer
   with front buffer (double buffering mechanism) since it doesn't have the
   knowledge of which sub-regions already got rendered. We should call
   fg_swap_window_buffers once all draw calls corresponding to all sub-regions are called
   when in multiview mode.
 */
fg_err fg_draw_chart_to_cell (
    const fg_window pWindow,
    const int pRows,
    const int pCols,
    const int pIndex,
    const fg_chart pChart,
    const(char)* pTitle);

/**
   Swap back buffer with front buffer

   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_swap_window_buffers (const fg_window pWindow);

/**
   Save the current frame buffer to a file at provided path.

   The frame buffer stored to the disk is saved in the image format based on the extension
   provided in the full file path string.

   \param[in] pFullPath is the path at which frame buffer is stored.
   \param[in] pWindow is Window handle

   \return \ref fg_err error code
 */
fg_err fg_save_window_framebuffer (const(char)* pFullPath, const fg_window pWindow);

/** @} */

/// \brief Window is where objects such as Images, Plots etc. are rendered.
