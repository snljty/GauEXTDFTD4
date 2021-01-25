#! /bin/dash

# Use External DFT-D4 for Gaussian

# You need to make sure the directory containing Gaussian executable 
# has been properly set to GAUSS_EXEDIR and within PATH environental variables.

# check http://gaussian.com/external/ for Gaussian External details
# $1 to $6 for layer InputFile OutputFile MsgFile FChkFile MatElFile

# get number of atoms
# natoms=`head -n 1 $2 | awk '{print $1}'`

# get number of gradient(s) needed
ngrad=`head -n 1 $2 | awk '{print $2}'`

# Generate Input file for Gaussian using External InputFile
./GeneExtInp $2

# Invoke Gaussian and DFT-D4 program
setting_file=ExtDFTD4_settings.ini
gau_exe_name=`grep 'the executable program of Gaussian' -A 1 ${setting_file} | tail -n 1`
dftd4_exe_name=`grep 'the executable program of dftd4' -A 1 ${setting_file} | tail -n 1`
dftd4_options=`grep 'other options of DFT-D4' -A 1 ${setting_file} | tail -n 1`
dftd4_func_name=`grep 'the functional name in dftd4' -A 1 ${setting_file} | tail -n 1`
charge=`head -n 1 $2 | awk '{print $3}'`

${gau_exe_name} < useExtGau.gjf > useExtGau.out

if [ ${ngrad} -eq 0 ]
then
  ${dftd4_exe_name} ${dftd4_options} --func ${dftd4_func_name} --chrg ${charge} \
useExtDFTD4.xyz 1> useExtDFTD4.out 2> /dev/null
else
  if [ ${ngrad} -eq 1 ]
  then
    ${dftd4_exe_name} ${dftd4_options} --func ${dftd4_func_name} --chrg ${charge} \
--grad useExtDFTD4.xyz 1> useExtDFTD4.out 2> /dev/null
  else
    if [ ${ngrad} -eq 2 ]
    then
      ${dftd4_exe_name} ${dftd4_options} --func ${dftd4_func_name} --chrg ${charge} \
--grad --hess useExtDFTD4.xyz 1> useExtDFTD4.out 2> /dev/null
    fi
  fi
fi

# Read and write data
./ReadExtOut $2 $3

# remove temporary files
rm useExtGau.gjf useExtGau.out useExtDFTD4.xyz useExtDFTD4.out 2> /dev/null
if [ ${ngrad} -ge 1 ]
then
  rm gradient 2> /dev/null
fi

