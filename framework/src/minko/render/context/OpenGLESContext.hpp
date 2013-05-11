#pragma once

#define GL_GLEXT_PROTOTYPES
#ifdef __APPLE__
# include <GLUT/glut.h>          /* Open GL Util    APPLE */
#else
# include <GL/glut.h>            /* Open GL Util    OpenGL*/
#endif

#include "minko/Common.hpp"
#include "minko/render/context/AbstractContext.hpp"
#include "minko/render/ShaderProgramInputs.hpp"

namespace minko
{
	namespace render
	{
		namespace context
		{
			using namespace minko::render;

			class OpenGLESContext :
				public AbstractContext,
				public std::enable_shared_from_this<OpenGLESContext>
			{
			public:
				typedef std::shared_ptr<OpenGLESContext> ptr;

			public:
				~OpenGLESContext();

				static
				ptr
				create()
				{
					return std::shared_ptr<OpenGLESContext>(new OpenGLESContext());
				}

				void
				configureViewport(const unsigned int x,
								  const unsigned int y,
								  const unsigned int with,
								  const unsigned int height);

				void
				clear(float red 			= 0.f,
					  float green			= 0.f,
					  float blue			= 0.f,
					  float alpha			= 0.f,
					  float depth			= 1.f,
					  unsigned int stencil	= 0,
					  unsigned int mask		= 0xffffffff);

				void
				present();

				void
				drawTriangles(const unsigned int indexBuffer, const int numTriangles);

				const unsigned int
				createVertexBuffer(const unsigned int size);

				void
				setVertexBufferAt(const unsigned int index, const unsigned int vertexBuffer);

				void
				uploadVertexBufferData(const unsigned int 	vertexBuffer,
									   const unsigned int 	offset,
									   const unsigned int 	size,
									   void* 				data);
				
				void
				deleteVertexBuffer(const unsigned int vertexBuffer);
				
				const unsigned int
				createIndexBuffer(const unsigned int size);

				void
				uploaderIndexBufferData(const unsigned int 	indexBuffer,
										const unsigned int 	offset,
										const unsigned int 	size,
										void*				data);

				void
				deleteIndexBuffer(const unsigned int indexBuffer);

				const unsigned int
				createTexture(unsigned int width,
							  unsigned int height,
							  bool		   mipMapping);

				void
				uploadTextureData(const unsigned int texture,
								  unsigned int 		 width,
								  unsigned int 		 height,
								  unsigned int 		 mipLevel,
								  void*				 data);

				void
				deleteTexture(const unsigned int texture);

				const unsigned int
				createProgram();

				void
				attachShader(const unsigned int program, const unsigned int shader);

				void
				linkProgram(const unsigned int program);

				void
				deleteProgram(const unsigned int program);

				void
				compileShader(const unsigned int shader);

				void
				setProgram(const unsigned int program);

				void
				setShaderSource(const unsigned int shader, const std::string& source);

				const unsigned int
				createVertexShader();

				void
				deleteVertexShader(const unsigned int vertexShader);

				const unsigned int
				createFragmentShader();

				void
				deleteFragmentShader(const unsigned int fragmentShader);

				std::shared_ptr<ShaderProgramInputs>
				getProgramInputs(const unsigned int program);

				std::string
				getShaderCompilationLogs(const unsigned int shader);

				std::string
				getProgramInfoLogs(const unsigned int program);

			private:
				std::list<unsigned int>	_vertexBuffers;
				std::list<unsigned int>	_indexBuffers;
				std::list<unsigned int>	_textures;
				std::list<unsigned int> _programs;
				std::list<unsigned int> _vertexShaders;
				std::list<unsigned int> _fragmentShaders;
			};
		}
	}
}