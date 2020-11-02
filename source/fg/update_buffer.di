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

/** \addtogroup util_functions
 * @{
 */

/**
    Update backend specific vertex buffer from given host side memory

    \param[in] pBufferId is the buffer identifier
    \param[in] pBufferSize is the buffer size in bytes
    \param[in] pBufferData is the pointer of the host side memory

    \return \ref fg_err error code
 */
fg_err fg_update_vertex_buffer (
    const uint pBufferId,
    const size_t pBufferSize,
    const(void)* pBufferData);

/**
    Update backend specific pixel buffer from given host side memory

    \param[in] pBufferId is the buffer identifier
    \param[in] pBufferSize is the buffer size in bytes
    \param[in] pBufferData is the pointer of the host side memory

    \return \ref fg_err error code
 */
fg_err fg_update_pixel_buffer (
    const uint pBufferId,
    const size_t pBufferSize,
    const(void)* pBufferData);

/**
    Sync all rendering operations till this point

    \return \ref fg_err error code
 */
fg_err fg_finish ();

/** @} */
