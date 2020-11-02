/*******************************************************
 * Copyright (c) 2015-2019, ArrayFire
 * All rights reserved.
 *
 * This file is distributed under 3-clause BSD license.
 * The complete license agreement can be obtained at:
 * http://arrayfire.com/licenses/BSD-3-Clause
 ********************************************************/

extern (C):

/** \addtogroup vfield_functions
 * @{
 */

/**
   Create a Vector field object

   \param[out] pField will be set to surface handle upon creating the surface object
   \param[in] pNPoints is number of data points
   \param[in] pType takes one of the values of \ref fg_dtype that indicates
              the integral data type of surface data
   \param[in] pChartType dictates the dimensionality of the chart

   \return \ref fg_err error code
 */
fg_err fg_create_vector_field (
    fg_vector_field* pField,
    const uint pNPoints,
    const fg_dtype pType,
    const fg_chart_type pChartType);

/**
   Increase reference count of the resource

   \param[out] pOut is the new handle to existing resource
   \param[in] pIn is the existing resource handle

   \return \ref fg_err error code
 */
fg_err fg_retain_vector_field (fg_vector_field* pOut, fg_vector_field pIn);

/**
   Destroy vector field object

   \param[in] pField is the surface handle

   \return \ref fg_err error code
 */
fg_err fg_release_vector_field (fg_vector_field pField);

/**
   Set the color of vector field

   \param[in] pField is the surface handle
   \param[in] pRed is Red component in range [0, 1]
   \param[in] pGreen is Green component in range [0, 1]
   \param[in] pBlue is Blue component in range [0, 1]
   \param[in] pAlpha is Blue component in range [0, 1]

   \return \ref fg_err error code
 */
fg_err fg_set_vector_field_color (
    fg_vector_field pField,
    const float pRed,
    const float pGreen,
    const float pBlue,
    const float pAlpha);

/**
   Set vector field legend

   \param[in] pField is the vector field handle
   \param[in] pLegend

   \return \ref fg_err error code
 */
fg_err fg_set_vector_field_legend (fg_vector_field pField, const(char)* pLegend);

/**
   Get the resource identifier for vertices buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pField is the vector field handle

   \return \ref fg_err error code
 */
fg_err fg_get_vector_field_vertex_buffer (uint* pOut, const fg_vector_field pField);

/**
   Get the resource identifier for colors buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pField is the vector field handle

   \return \ref fg_err error code
 */
fg_err fg_get_vector_field_color_buffer (uint* pOut, const fg_vector_field pField);

/**
   Get the resource identifier for alpha values buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pField is the vector field handle

   \return \ref fg_err error code
 */
fg_err fg_get_vector_field_alpha_buffer (uint* pOut, const fg_vector_field pField);

/**
   Get the resource identifier for directions buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pField is the vector field handle

   \return \ref fg_err error code
 */
fg_err fg_get_vector_field_direction_buffer (uint* pOut, const fg_vector_field pField);

/**
   Get the vertices buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pField is the vector field handle

   \return \ref fg_err error code
 */
fg_err fg_get_vector_field_vertex_buffer_size (uint* pOut, const fg_vector_field pField);

/**
   Get the colors buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pField is the vector field handle

   \return \ref fg_err error code
 */
fg_err fg_get_vector_field_color_buffer_size (uint* pOut, const fg_vector_field pField);

/**
   Get the alpha values buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pField is the vector field handle

   \return \ref fg_err error code
 */
fg_err fg_get_vector_field_alpha_buffer_size (uint* pOut, const fg_vector_field pField);

/**
   Get the directions buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pField is the vector field handle

   \return \ref fg_err error code
 */
fg_err fg_get_vector_field_direction_buffer_size (uint* pOut, const fg_vector_field pField);

/** @} */

/// \brief VectorField is a line graph to display two dimensional data.
