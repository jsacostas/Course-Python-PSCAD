
# coding: utf-8

# In[2]:

# Import configuration file and automation library
import sys, os
sys.path.append(r"C:\Program Files (x86)\PSCAD\Automation\Lib\mhrc")

import automation.controller

# Import other utilities to perform cool stuff
from win32com.client.gencache import EnsureDispatch as Dispatch
from automation.utilities.word import Word
from automation.utilities.file import File
import win32com.client
import shutil

#---------------------------------------------------------------------
# Configuration
#---------------------------------------------------------------------

pscad_version = 'PSCAD 4.6.2 (x64)'
fortran_version = 'GFortran 4.6.2'
fortran_ext = '.gf46'

# Working directory (use current directory)
working_dir = os.getcwd() + "\\"

#---------------------------------------------------------------------
# Main script 
#---------------------------------------------------------------------

project_name = 'automationTest'

# Source and destination folders for output data
src_folder = working_dir + project_name + fortran_ext
dst_folder = working_dir + "testAutomation_Output"   

# Get the Automation Controller that is used to launch PSCAD
controller = automation.controller.Controller()

# Launch PSCAD and silence all dialogue boxes
pscad = controller.launch(pscad_version, options={'silence': True})

# Set the compiler
pscad.settings(fortran_version=fortran_version)

# Load the project
pscad.load([working_dir + project_name + ".pscx"])
project = pscad.project(project_name) 
project.focus()

# Get the "Main" canvas
main = project.user_canvas('Main')

project.run()

