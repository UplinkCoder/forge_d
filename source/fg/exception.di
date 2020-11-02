/*******************************************************
 * Copyright (c) 2015-2019, ArrayFire
 * All rights reserved.
 *
 * This file is distributed under 3-clause BSD license.
 * The complete license agreement can be obtained at:
 * http://arrayfire.com/licenses/BSD-3-Clause
 ********************************************************/

public import defines;

extern (C):

/// \brief Error is exception object thrown by forge for internal errors

// namespace forge

/**
    Fetch the last error's error code

    \ingroup util_functions
 */
void fg_get_last_error (char** msg, int* len);

/**
    Fetch the string message associated to given error code

    \ingroup util_functions
 */
const(char)* fg_err_to_string (const fg_err err);

