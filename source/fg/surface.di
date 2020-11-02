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

/** \addtogroup surf_functions
 * @{
 */

/**
   Create a Surface object

   \param[out] pSurface will be set to surface handle upon creating the surface object
   \param[in] pXPoints is number of data points along X dimension
   \param[in] pYPoints is number of data points along Y dimension
   \param[in] pType takes one of the values of \ref fg_dtype that indicates
              the integral data type of surface data
   \param[in] pPlotType dictates the type of surface/graph,
              it can take one of the values of \ref fg_plot_type
   \param[in] pMarkerType indicates which symbol is rendered as marker. It can take one of
              the values of \ref fg_marker_type.

   \return \ref fg_err error code
 */
fg_err fg_create_surface (
    fg_surface* pSurface,
    const uint pXPoints,
    const uint pYPoints,
    const fg_dtype pType,
    const fg_plot_type pPlotType,
    const fg_marker_type pMarkerType);

/**
   Increase reference count of the resource

   \param[out] pOut is the new handle to existing resource
   \param[in] pIn is the existing resource handle

   \return \ref fg_err error code
 */
fg_err fg_retain_surface (fg_surface* pOut, fg_surface pIn);

/**
   Destroy surface object

   \param[in] pSurface is the surface handle

   \return \ref fg_err error code
 */
fg_err fg_release_surface (fg_surface pSurface);

/**
   Set the color of surface

   \param[in] pSurface is the surface handle
   \param[in] pRed is Red component in range [0, 1]
   \param[in] pGreen is Green component in range [0, 1]
   \param[in] pBlue is Blue component in range [0, 1]
   \param[in] pAlpha is Blue component in range [0, 1]

   \return \ref fg_err error code
 */
fg_err fg_set_surface_color (
    fg_surface pSurface,
    const float pRed,
    const float pGreen,
    const float pBlue,
    const float pAlpha);

/**
   Set surface legend

   \param[in] pSurface is the surface handle
   \param[in] pLegend

   \return \ref fg_err error code
 */
fg_err fg_set_surface_legend (fg_surface pSurface, const(char)* pLegend);

/**
   Get the resource identifier for vertices buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pSurface is the surface handle

   \return \ref fg_err error code
 */
fg_err fg_get_surface_vertex_buffer (uint* pOut, const fg_surface pSurface);

/**
   Get the resource identifier for colors buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pSurface is the surface handle

   \return \ref fg_err error code
 */
fg_err fg_get_surface_color_buffer (uint* pOut, const fg_surface pSurface);

/**
   Get the resource identifier for alpha values buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pSurface is the surface handle

   \return \ref fg_err error code
 */
fg_err fg_get_surface_alpha_buffer (uint* pOut, const fg_surface pSurface);

/**
   Get the vertices buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pSurface is the surface handle

   \return \ref fg_err error code
 */
fg_err fg_get_surface_vertex_buffer_size (uint* pOut, const fg_surface pSurface);

/**
   Get the colors buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pSurface is the surface handle

   \return \ref fg_err error code
 */
fg_err fg_get_surface_color_buffer_size (uint* pOut, const fg_surface pSurface);

/**
   Get the alpha values buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pSurface is the surface handle

   \return \ref fg_err error code
 */
fg_err fg_get_surface_alpha_buffer_size (uint* pOut, const fg_surface pSurface);

/** @} */

/// \brief Surface is a graph to display three dimensional data.
