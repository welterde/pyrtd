from distutils.core import setup, Extension

setup(name='pyrtd',
      version='0.1',
      description='Python ESO RTD binding',
      author='Tassilo Schweyer',
      author_email='dev@welterde.de',
      ext_modules=[Extension('_pyrtd', ['pyrtd.i'],
                             swig_opts=['-modern'],
                             include_dirs=['include'],
                             libraries=['rtd3.2.1'])],
      py_modules=['pyrtd'],
      )
