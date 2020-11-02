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

/** \addtogroup font_functions
 *  @{
 */

/**
   Create a Font object

   \param[out] pFont will point to the font object created after this function returns

   \return \ref fg_err error code
 */
fg_err fg_create_font (fg_font* pFont);

/**
   Increase reference count of the resource

   \param[out] pOut is the new handle to existing resource
   \param[in] pIn is the existing resource handle

   \return \ref fg_err error code
 */
fg_err fg_retain_font (fg_font* pOut, fg_font pIn);

/**
   Destroy font object

   \param[in] pFont is the font handle

   \return \ref fg_err error code
 */
fg_err fg_release_font (fg_font pFont);

/**
   Load a given font file

   \param[in] pFont is the font handle
   \param[in] pFileFullPath True Type Font file path

   \return \ref fg_err error code
 */
fg_err fg_load_font_file (fg_font pFont, const char* pFileFullPath);

/**
   Load a system font based on the name

   \param[in] pFont is the font handle
   \param[in] pFontName True Type Font name

   \return \ref fg_err error code
 */
fg_err fg_load_system_font (fg_font pFont, const char* pFontName);

/** @} */

/// \brief Font object is a resource handler for the font you want to use
