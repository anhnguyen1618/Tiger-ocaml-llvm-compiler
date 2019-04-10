import os, fnmatch, sys, argparse

TEST_DIR = "./test"
TEST_FILE_PATTERN = '*.tig'
SUCCESS_CODE = 0
OUTPUT_DIR = "llvm_byte_code/test/"

GREEN_COLOR = '\033[92m'
RED_COLOR = '\033[91m'
END_COLOR = '\033[0m'

TICK_ICON = u'\u2713'
X_ICON = u'\u2718'

def print_success(file_name):
    print(GREEN_COLOR + TICK_ICON + ' ' + file_name + END_COLOR)

def print_error(file_name):
    print(RED_COLOR + X_ICON + ' ' + file_name + END_COLOR)

def create_output_dir():
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)

def build_compiler():
    create_output_dir()
    cmd = ("ocamlbuild -tag 'debug, explain' -use-menhir -use-ocamlfind -package llvm src/parse.native &&"
           "mv _build/src/parse.native bin/compiler")
    exit_code = os.system(cmd)
    if exit_code != SUCCESS_CODE:
        print_error("Build Ocaml compiler fail")
        exit(exit_code)

def run_single_test_without_compile(file_name):
    output_file_path = OUTPUT_DIR + file_name
    cmd = ("./bin/compiler test/" + file_name + " &&"
     "opt -f -S " + output_file_path +".ll -o " + output_file_path +"-opt.ll -Oz &&"
     "llc " + output_file_path + "-opt.ll &&"
     "clang " + output_file_path + "-opt.s src/bindings.c -o run_prog &&"
     "./run_prog")

    code = os.system(cmd)
    return code


def run_single_test_compile(file_name):
    print "================== RUN SINGLE TEST =================="
    build_compiler()
    exit_code = run_single_test_without_compile(file_name)

    if exit_code != SUCCESS_CODE:
        print_error(file_name)
    else:
        print_success(file_name)
        

def run_all_test():
    print "================== RUN ALL TESTS =================="
    all_files_in_test_dir = os.listdir(TEST_DIR)
    test_files = list(filter(lambda file_name: fnmatch.fnmatch(file_name, TEST_FILE_PATTERN), all_files_in_test_dir))

    build_compiler()
    test_fails = []
    number_of_tests = 0
    
    for test_file in test_files:
        number_of_tests = number_of_tests + 1
        exit_code = run_single_test_without_compile(test_file)
        if exit_code != SUCCESS_CODE:
            print_error(test_file)
            test_fails.append(test_file)
        else:
            print_success(test_file)

    if len(test_fails) > 0:
        print "================== FAILED TESTS =================="
        for test_fail in test_fails:
            print_error(test_fail)
    else:
        print "================== ALL TESTS PASSED ("+ str(number_of_tests) +" cases) =================="
 
parser = argparse.ArgumentParser()
parser.add_argument("-s", "--single", type=str,
                        help="run single test")
args = parser.parse_args()

def main():   
    if args.single != None:
        run_single_test_compile(args.single)
    else:
        run_all_test()

if __name__ == '__main__':
    main()
