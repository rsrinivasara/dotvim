import os
import ycm_core
from clang_helpers import PrepareClangFlags

flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-DUSE_CLANG_COMPLETER',
    '-std=c++14',
    '-x', 'c++',
    '-I', '/usr/include',
    '-I', '/usr/include/c++/4.9.2',
    '-I',
    '/media/data1/Ram/coursera/HetrogeneousParallelProgramming/Labs/libwb',
    '-I', '/opt/cuda/include',
    '-I', '.',
]

compilation_database_folder = ''

if compilation_database_folder:
    database = ycm_core.CompilationDatabase(compilation_database_folder)
else:
    database = None


def DirectoryOfThisScript():
    return os.path.dirname(os.path.abspath(__file__))


def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return flags
    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']

    view_name = os.getenv('VIEW_NAME')

    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                if '__VIEW__' in flag and view_name is not None:
                    flag = flag.replace('__VIEW__', view_name)

                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)
    return new_flags


def FlagsForFile(filename):
    if database:
        compilation_info = database.GetCompilationInfoForFile(filename)
        final_flags = PrepareClangFlags(MakeRelativePathsInFlagsAbsolute(
                                        compilation_info.compiler_flags_,
                                        compilation_info.compiler_working_dir_),
                                        filename)
    else:
        relative_to = DirectoryOfThisScript()
        final_flags = MakeRelativePathsInFlagsAbsolute(flags, relative_to)

    return {'flags': final_flags, 'do_cache': True}


def main():
    print FlagsForFile('/home/ram/test.cpp')

if __name__ == "__main__":
    main()
