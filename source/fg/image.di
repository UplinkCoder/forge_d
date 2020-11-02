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

/** \addtogroup image_functions
 *  @{
 */

/**
   Create a Image object

   \param[out] pImage will be set to created Image object
   \param[in] pWidth Width of the image
   \param[in] pHeight Height of the image
   \param[in] pFormat Color channel format of image, uses one of the values
              of \ref fg_channel_format
   \param[in] pType takes one of the values of \ref fg_dtype that indicates
              the integral data type of histogram data

   \return \ref fg_err error code
 */
fg_err fg_create_image (
    fg_image* pImage,
    const uint pWidth,
    const uint pHeight,
    const fg_channel_format pFormat,
    const fg_dtype pType);

/**
   Increment the internal reference counter for image resource

   \param[out] pOut is new reference to existing image resource
   \param[in] pImage is the input image resource handle

   \return \ref fg_err error code
 */
fg_err fg_retain_image (fg_image* pOut, fg_image pImage);

/**
   Destroy image object

   \param[in] pImage is the image handle

   \return \ref fg_err error code
 */
fg_err fg_release_image (fg_image pImage);

/**
   Set a global alpha value for rendering the image

   \param[in] pImage is the image handle
   \param[in] pAlpha

   \return \ref fg_err error code
 */
fg_err fg_set_image_alpha (fg_image pImage, const float pAlpha);

/**
   Set option to inform whether to maintain aspect ratio of original image

   \param[in] pImage is the image handle
   \param[in] pKeepRatio informs the image object if original aspect ratio has to be maintained

   \return \ref fg_err error code
 */
fg_err fg_set_image_aspect_ratio (fg_image pImage, const bool pKeepRatio);

/**
   Get the width of the image

   \param[out] pOut will be set to the width of the image
   \param[in] pImage is the image handle

   \return \ref fg_err error code
 */
fg_err fg_get_image_width (uint* pOut, const fg_image pImage);

/**
   Get the height of the image

   \param[out] pOut will be set to the height of the image
   \param[in] pImage is the image handle

   \return \ref fg_err error code
 */
fg_err fg_get_image_height (uint* pOut, const fg_image pImage);

/**
   Get the channel format of the image

   \param[out] pOut will be set to the channel format of the image
   \param[in] pImage is the image handle

   \return \ref fg_err error code
 */
fg_err fg_get_image_pixelformat (fg_channel_format* pOut, const fg_image pImage);

/**
   Get the pixel data type of the image

   \param[out] pOut will be set to the pixel data type of the image
   \param[in] pImage is the image handle

   \return \ref fg_err error code
 */
fg_err fg_get_image_type (fg_dtype* pOut, const fg_image pImage);

/**
   Get the image buffer resource identifier

   \param[out] pOut will be set to the image resource identifier
   \param[in] pImage is the image handle

   \return \ref fg_err error code
 */
fg_err fg_get_pixel_buffer (uint* pOut, const fg_image pImage);

/**
   Get the image buffer size in bytes

   \param[out] pOut will be set to the image buffer size in bytes
   \param[in] pImage is the image handle

   \return \ref fg_err error code
 */
fg_err fg_get_image_size (uint* pOut, const fg_image pImage);

/**
   Render the image to given window

   \param[in] pWindow is target window to where image will be rendered
   \param[in] pImage is the image handle
   \param[in] pX is x coordinate of origin of viewport in window coordinates
   \param[in] pY is y coordinate of origin of viewport in window coordinates
   \param[in] pWidth is the width of the viewport
   \param[in] pHeight is the height of the viewport

   \return \ref fg_err error code
 */
fg_err fg_render_image (
    const fg_window pWindow,
    const fg_image pImage,
    const int pX,
    const int pY,
    const int pWidth,
    const int pHeight);

/** @} */

/// \brief Image helps rendering an image in a window
