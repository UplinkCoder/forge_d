/*******************************************************
 * Copyright (c) 2015-2019, ArrayFire
 * All rights reserved.
 *
 * This file is distributed under 3-clause BSD license.
 * The complete license agreement can be obtained at:
 * http://arrayfire.com/licenses/BSD-3-Clause
 ********************************************************/

extern (C):

// No special headers for cpu backend

version = CPU_BACKEND;

public import fg.defines;

version(CPU_BACKEND)
{
    import core.stdc.stdlib;
    import fg.update_buffer;

    void createGLBuffer(GfxHandle** pOut, const uint pResourceId, const BufferType pTarget)
    {
        GfxHandle* temp = cast(GfxHandle*)malloc(GfxHandle.sizeof);

        temp.mId = pResourceId;
        temp.mTarget = pTarget;

        *pOut = temp;
    }

    void releaseGLBuffer(GfxHandle* pHandle)
    {
        free(pHandle);
    }

    void copyToGLBuffer(GfxHandle* pGLDestination, ComputeResourceHandle pSource, const size_t pSize)
    {
        GfxHandle* temp = pGLDestination;

        if (temp.mTarget==BufferType.FORGE_IMAGE_BUFFER) {
            fg_update_pixel_buffer(temp.mId, pSize, pSource);
        } else if (temp.mTarget==BufferType.FORGE_VERTEX_BUFFER) {
            fg_update_vertex_buffer(temp.mId, pSize, pSource);
        }
    }
}

// gl.h is required by cuda_gl_interop to be included before it
// And gl.h requires windows.h to be included before it

// OS_WIN

// GL_VERSION

// No special headers for opencl backend

/// A backend-agnostic handle to a compute memory resource originating
/// from an OpenGL resource.
///
/// - cudaGraphicsResource in CUDA
/// - cl_mem in OpenCL
/// - unsigned from standard cpu
/// OpenGL interop with CPU uses regular OpenGL buffer
alias GfxResourceHandle = uint;

/// OpenGL interop with CUDA uses an opaque CUDA object

/// OpenGL interop with OpenCL uses cl_mem object

/** A backend-agnostic handle to a compute memory resource.

  For example:
    CUDA device pointer, like float*, int* from cudaMalloc.
    A cl_mem* from OpenCL's clCreateBuffer
  */
alias ComputeResourceHandle = void*;

/// Enum to indicate if OpenCL buffer is a PBO or VBO
enum BufferType
{
    FORGE_IMAGE_BUFFER = 0, ///< OpenGL Pixel Buffer Object
    FORGE_VERTEX_BUFFER = 1 ///< OpenGL Vertex Buffer Object
}

/// A tuple object of GfxResourceHandle and \ref BufferType
struct GfxHandle
{
    GfxResourceHandle mId;
    BufferType mTarget;
}

///////////////////////////////////////////////////////////////////////////////

void createGLBuffer (
    GfxHandle** pOut,
    const uint pResourceId,
    const BufferType pTarget);

void releaseGLBuffer (GfxHandle* pHandle);

void copyToGLBuffer (
    GfxHandle* pGLDestination,
    ComputeResourceHandle pSource,
    const size_t pSize);

///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////

// The user is expected to implement a function
// `cl_command_queue getCommandQueue()`

///////////////////////////////////////////////////////////////////////////////

