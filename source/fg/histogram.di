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

/** \addtogroup hist_functions
 *  @{
 */

/**
   Creates a Histogram object

   \param[out] pHistogram will point to the histogram object created after this function call
   \param[in] pNBins is number of bins the data is sorted out
   \param[in] pDataType takes one of the values of \ref fg_dtype that indicates
              the integral data type of histogram data

   \return \ref fg_err error code
 */
fg_err fg_create_histogram (
    fg_histogram* pHistogram,
    const uint pNBins,
    const fg_dtype pDataType);

/**
   Increase reference count of the resource

   \param[out] pOut is the new handle to existing resource
   \param[in] pIn is the existing resource handle

   \return \ref fg_err error code
 */
fg_err fg_retain_histogram (fg_histogram* pOut, fg_histogram pIn);

/**
   Destroy Histogram object

   \param[in] pHistogram is the histogram handle

   \return \ref fg_err error code
 */
fg_err fg_release_histogram (fg_histogram pHistogram);

/**
   Set the color of bar in the bar graph(histogram)

   This is global alpha value for the histogram rendering that takes
   effect if individual bar alphas are not set by calling the following
   member functions
       - Histogram::alphas()
       - Histogram::alphasSize()

   \param[in] pHistogram is the histogram handle
   \param[in] pRed is Red component in range [0, 1]
   \param[in] pGreen is Green component in range [0, 1]
   \param[in] pBlue is Blue component in range [0, 1]
   \param[in] pAlpha is Alpha component in range [0, 1]

   \return \ref fg_err error code
 */
fg_err fg_set_histogram_color (
    fg_histogram pHistogram,
    const float pRed,
    const float pGreen,
    const float pBlue,
    const float pAlpha);

/**
   Set legend for histogram plot

   \param[in] pHistogram is the histogram handle
   \param[in] pLegend

   \return \ref fg_err error code
 */
fg_err fg_set_histogram_legend (fg_histogram pHistogram, const(char)* pLegend);

/**
   Get the resource identifier for vertices buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pHistogram is the histogram handle

   \return \ref fg_err error code
 */
fg_err fg_get_histogram_vertex_buffer (uint* pOut, const fg_histogram pHistogram);

/**
   Get the resource identifier for colors buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pHistogram is the histogram handle

   \return \ref fg_err error code
 */
fg_err fg_get_histogram_color_buffer (uint* pOut, const fg_histogram pHistogram);

/**
   Get the resource identifier for alpha values buffer

   \param[out] pOut will have the buffer identifier after this function is called
   \param[in] pHistogram is the histogram handle

   \return \ref fg_err error code
 */
fg_err fg_get_histogram_alpha_buffer (uint* pOut, const fg_histogram pHistogram);

/**
   Get the vertices buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pHistogram is the histogram handle

   \return \ref fg_err error code
 */
fg_err fg_get_histogram_vertex_buffer_size (uint* pOut, const fg_histogram pHistogram);

/**
   Get the colors buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pHistogram is the histogram handle

   \return \ref fg_err error code
 */
fg_err fg_get_histogram_color_buffer_size (uint* pOut, const fg_histogram pHistogram);

/**
   Get the alpha values buffer size in bytes

   \param[out] pOut will have the buffer size in bytes after this function is called
   \param[in] pHistogram is the histogram handle

   \return \ref fg_err error code
 */
fg_err fg_get_histogram_alpha_buffer_size (uint* pOut, const fg_histogram pHistogram);

/** @} */

/// \brief Histogram is a bar graph to display data frequencey.
