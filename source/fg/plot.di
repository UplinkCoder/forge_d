/*******************************************************
 * Copyright (c) 2015-2019, ArrayFire
 * All rights reserved.
 *
 * This file is distributed under 3-clause BSD license.
 * The complete license agreement can be obtained at:
 * http://arrayfire.com/licenses/BSD-3-Clause
 ********************************************************/

public import fg.defines;

extern (C):

/** \addtogroup plot_functions
 * @{
 */

/**
   Create a Plot object

   \param[out] pPlot will be set to plot handle upon creating the plot object
   \param[in] pNPoints is number of data points to display
   \param[in] pType takes one of the values of \ref fg_dtype that indicates
              the integral data type of plot data
   \param[in] pChartType dictates the dimensionality of the chart
   \param[in] pPlotType dictates the type of plot/graph,
              it can take one of the values of \ref fg_plot_type
   \param[in] pMarkerType indicates which symbol is rendered as marker. It can take one of
              the values of \ref fg_marker_type.

   \return \ref fg_err error code
 */
fg_err fg_create_plot (
    fg_plot* pPlot,
    const uint pNPoints,
    const fg_dtype pType,
    const fg_chart_type pChartType,
    const fg_plot_type pPlotType,
    const fg_marker_type pMarkerType);

/**
   Increase reference count of the resource

   \param[out] pOut is the new handle to existing resource
   \param[in] pIn is the existing resource handle

   \return \ref fg_err error code
 */
fg_err fg_retain_plot (fg_plot* pOut, fg_plot pIn);

/**
   Destroy plot object

   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_release_plot (fg_plot pPlot);

/**
   Set the color of line graph(plot)

   \param[in] pPlot is the plot handle
   \param[in] pRed is Red component in range [0, 1]
   \param[in] pGreen is Green component in range [0, 1]
   \param[in] pBlue is Blue component in range [0, 1]
   \param[in] pAlpha is Blue component in range [0, 1]

   \return \ref fg_err error code
 */
fg_err fg_set_plot_color (
    fg_plot pPlot,
    const float pRed,
    const float pGreen,
    const float pBlue,
    const float pAlpha);

/**
   Set plot legend

   \param[in] pPlot is the plot handle
   \param[in] pLegend

   \return \ref fg_err error code
 */
fg_err fg_set_plot_legend (fg_plot pPlot, const(char)* pLegend);

/**
   Set global marker size

   This size will be used for rendering markers if no per vertex marker sizes are provided.
   This value defaults to 10

   \param[in] pPlot is the plot handle
   \param[in] pMarkerSize is the target marker size for scatter plots or line plots with markers

   \return \ref fg_err error code
 */
fg_err fg_set_plot_marker_size (fg_plot pPlot, const float pMarkerSize);

/**
   Get the resource identifier for vertices buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_get_plot_vertex_buffer (uint* pOut, const fg_plot pPlot);

/**
   Get the resource identifier for colors buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_get_plot_color_buffer (uint* pOut, const fg_plot pPlot);

/**
   Get the resource identifier for alpha values buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_get_plot_alpha_buffer (uint* pOut, const fg_plot pPlot);

/**
   Get the resource identifier for markers radii buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_get_plot_radii_buffer (uint* pOut, const fg_plot pPlot);

/**
   Get the vertices buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_get_plot_vertex_buffer_size (uint* pOut, const fg_plot pPlot);

/**
   Get the colors buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_get_plot_color_buffer_size (uint* pOut, const fg_plot pPlot);

/**
   Get the alpha values buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_get_plot_alpha_buffer_size (uint* pOut, const fg_plot pPlot);

/**
   Get the markers buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pPlot is the plot handle

   \return \ref fg_err error code
 */
fg_err fg_get_plot_radii_buffer_size (uint* pOut, const fg_plot pPlot);

/** @} */

/// \brief Plot is a line graph to display two dimensional data.
