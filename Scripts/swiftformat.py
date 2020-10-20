import os
import subprocess

def swiftformats(cmd, files, config, swiftversion):
    for file in files:
        swiftformat(cmd, file, config, swiftversion)

def swiftformat(cmd, file, config, swiftversion):
    print("swiftformat " + file)
    subprocess.run([cmd, file, "--config", config, "--swiftversion", swiftversion])

def gitWorkingDirectoryFiles():
    files = read('git diff --name-only')
    swiftFiles = list(filter(isSwiftFile, files))
    paths = list(map(gitPath, swiftFiles))
    return paths

def gitStageFiles():
    files = read('git diff --cached --name-only')
    swiftFiles = list(filter(isSwiftFile, files))
    paths = list(map(gitPath, swiftFiles))
    return paths

def isSwiftFile(file):
    return file.endswith('.swift')

def gitPath(file):
    dir = read('git rev-parse --show-toplevel')[0]
    return dir + '/' + file

def read(cmd):
    p = os.popen(cmd, 'r')
    output = []
    while 1:
        line = p.readline()
        if not line: break
        output.append(line.strip())
    return output

currentDir = os.path.split(os.path.realpath(__file__))[0]
cmd = currentDir + '/' + 'swiftformat'
config = currentDir + '/' + '.swiftformat'
swiftversion = '5.2'
swiftformats(cmd, gitWorkingDirectoryFiles(), config, swiftversion)
swiftformats(cmd, gitStageFiles(), config, swiftversion)
