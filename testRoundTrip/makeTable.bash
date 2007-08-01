cat > regression.html <<EOT
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=ISO-8859-1"
 http-equiv="content-type">
  <title>Testing the OpenAD installation</title>
</head>
<body style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);"
 alink="#000099" link="#000099" vlink="#990099">
<div style="text-align: center;">
<div style="text-align: left;">
<h2 style="text-align: center;">Testing the Installation<br>
</h2>
There is a small
regression test suite with a setup script contained in <br>
<span style="font-family: courier new,courier,monospace;"><span
 style="color: rgb(255, 0, 0);">&lt;path_to_OpenAD&gt;/xaifBooster/testRoundTrip/</span><br>
</span>We compare the numerical output against a reference file. The
recent test results are found in the <a href="#test_results">table</a>
at the bottom. Depending on the machine the tests run on, the compiler
you use and the chosen
transformation (tangent-linear, joint or split adjoint) the numbers may
vary slightly. To execute all tests first<br>
<span
 style="font-family: courier new,courier,monospace; color: rgb(255, 0, 0);">&nbsp;&nbsp;&nbsp;
cd
&lt;path_to_OpenAD&gt;</span><br>
and set up the OpenAD environment
for <br>
<ul>
  <li>shell/ksh/bash etc users with:<br>
    <span
 style="font-family: courier new,courier,monospace; color: rgb(255, 0, 0);">source
./setenv.sh&nbsp; </span></li>
  <li>csh/tcsh etc. users with:<br>
    <span
 style="font-family: courier new,courier,monospace; color: rgb(255, 0, 0);">source
./setenv.csh</span></li>
</ul>
<span style="font-weight: bold;">modify the Makefile to use the
Fortran90 compiler of your choice</span> (default is <span
 style="font-family: courier new,courier,monospace;">ifort</span>) and
the invoke the script <br>
<span style="font-family: courier new,courier,monospace;">&nbsp;&nbsp;&nbsp;
<span style="color: rgb(255, 0, 0);">./testAll.bash</span></span><br>
For the first example it asks a few questions determining the
transformation mode as in the following example.&nbsp; For regression
testing you may choose <br>
<ul>
  <li>for tangent-linear code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
 style="font-family: courier new,courier,monospace;">BasicBlockPreaccumulation</span>&nbsp;&nbsp;&nbsp;
or &nbsp; &nbsp;&nbsp; <span
 style="font-family: courier new,courier,monospace;">MemOpsTradeoffPreaccumulation</span></li>
  <li>for adjoint code: &nbsp; &nbsp; <span
 style="font-family: courier new,courier,monospace;">BasicBlockPreaccumulationReverse</span></li>
</ul>
We marked the <span style="color: rgb(255, 0, 0);">user inputs</span>,
the<span style="color: rgb(51, 51, 255);"> transformation </span>and <span
 style="color: rgb(51, 204, 0);">compile/link </span>steps. The
environment setup defines the <span style="color: rgb(204, 51, 204);">absolute
paths</span>; your output may look slightly different.&nbsp;
<pre style="margin-left: 40px;"><span style="color: rgb(153, 153, 153);">xaifBooster/testRoundTrip&gt;</span> <span
 style="color: rgb(255, 0, 0); font-weight: bold;">./testAll.bash</span><br>use reverse mode y/[n]<span
 style="color: rgb(255, 0, 0); font-weight: bold;">n</span><br>using plain drivers<br>rm -f head.B head.prh* driver driver.o <br>rm -f -rf tmpOutput <br>rm -f head.f driver.f params.conf<br>rm -f -rf  tmpOutput verifiedOutput <br>** running mini1 *************************************************<span
 style="color: rgb(51, 51, 255);"></span><br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to_OpenaAD&gt;</span>/Open64/osprey1.0/targ_ia32_ia64_linux/crayf90/sgi/mfef90 .<br><span
 style="color: rgb(51, 51, 255);">./mfef90 -F -N132 head.f</span><br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to_OpenAD&gt;</span>/OpenADFortTk/obj/i686-Linux/obj/whirl2xaif .<br><span
 style="color: rgb(51, 51, 255);">./whirl2xaif -o head.xaif head.B</span><br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to_OpenAD&gt;</span>/xaif/schema/xaif.xsd .<br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(204, 51, 204);">&gt;</span>/xaif/schema/xaif_base.xsd .<br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(204, 51, 204);">&gt;</span>/xaif/schema/xaif_inlinable_intrinsics.xsd .<br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(204, 51, 204);">&gt;</span>/xaif/schema/xaif_derivative_propagator.xsd .<br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(204, 51, 204);">&gt;</span>/xaif/schema/xaif_output.xsd .<br>./pickAlgorithm.bash<br>pick one of the following algorithms<br>1 : BasicBlockPreaccumulation<br>2 : BasicBlockPreaccumulationReverse<br>3 : BasicBlockPreaccumulationTape<br>4 : BasicBlockPreaccumulationTapeAdjoint<br>5 : ControlFlowReversal<br>6 : Linearization<br>7 : MemOpsTradeoffPreaccumulation<br>pick a number: <span
 style="color: rgb(255, 0, 0); font-weight: bold;">1</span><br><span
 style="color: rgb(51, 51, 255);">./xaifBooster -i head.xaif -c <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span></span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(51, 51, 255);"><span
 style="color: rgb(204, 51, 204);">&gt;</span>/xaif-1.0/schema/examples/inlinable_intrinsics.xaif -o head.xb.xaif</span><br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(204, 51, 204);">&gt;</span>/OpenADFortTk/obj/i686-Linux/obj/xaif2whirl .<br><span
 style="color: rgb(51, 51, 255);">./xaif2whirl --structured head.B head.xb.xaif</span><br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(204, 51, 204);">&gt;</span>/Open64/osprey1.0/targ_ia32_ia64_linux/whirl2f/whirl2f .<br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(204, 51, 204);">&gt;</span>/Open64/osprey1.0/targ_ia32_ia64_linux/whirl2f/whirl2f_be .<br><span
 style="color: rgb(51, 51, 255);">./whirl2f -openad head.xb.x2w.B</span><br>./whirl2f translates head.xb.x2w.B into head.xb.x2w.w2f.f, based on source head.xb.x2w.f<span
 style="color: rgb(51, 51, 255);"></span><br>ln -sf <span
 style="color: rgb(204, 51, 204);">&lt;path_to</span><span
 style="color: rgb(204, 51, 204);">_OpenAD</span><span
 style="color: rgb(204, 51, 204);">&gt;</span>/OpenADFortTk/postprocess/pp.pl .<br><span
 style="color: rgb(51, 51, 255);">perl pp.pl -f head.xb.x2w.w2f.f</span><br><span
 style="color: rgb(51, 204, 0);">f95 -c w2f__types.f</span><br>Obsolescent: w2f__types.f, line 1: Fixed source form<br><span
 style="color: rgb(51, 204, 0);">f95 -free -c active_module.f</span><br
 style="color: rgb(51, 204, 0);"><span style="color: rgb(51, 204, 0);">f95 -free -c driver.f</span><br
 style="color: rgb(51, 204, 0);"><span style="color: rgb(51, 204, 0);">f95 -c head.xb.x2w.w2f.pp.f</span><br>Obsolescent: head.xb.x2w.w2f.pp.f, line 6: Fixed source form<br><span
 style="color: rgb(51, 204, 0);">f95 w2f__types.o active_module.o driver.o head.xb.x2w.w2f.pp.o -o driver</span><br>ln -s simple.params.conf params.conf<br>mkdir -p tmpOutput<br>./driver<br>no diffs<br><span
 style="color: rgb(153, 153, 153);">xaifBooster/testRoundTrip<br></span></pre>
<br>
<a name="test_results"></a>test results:<br>
<font size=\"-1\">
<table style="width: 100%; text-align: left;" border="1" cellpadding="2"
 cellspacing="2">
  <tbody>
    <tr>
      <td colspan="1" rowspan="3"
 style="vertical-align: top; background-color: rgb(238, 238, 238);">name<br>
      </td>
      <td colspan="3" rowspan="1"
 style="vertical-align: top; background-color: rgb(238, 238, 238);">issues
(small numerical differences are always expected)</td>
    </tr>
    <tr>
      <td colspan="1" rowspan="2"
 style="vertical-align: top; background-color: rgb(238, 238, 238);">tangent-linear
      <br>
(using <span style="font-family: courier new,courier,monospace;">BasicBlockPreaccumulation</span>)<br>
      </td>
      <td colspan="2" rowspan="1"
 style="vertical-align: top; background-color: rgb(238, 238, 238);">adjoint
(reverse, using <span
 style="font-family: courier new,courier,monospace;">BasicBlockPreaccumulationReverse</span>)
      <br>
      </td>
    </tr>
    <tr>
      <td
 style="vertical-align: top; background-color: rgb(238, 238, 238);">joint<br>
      </td>
      <td
 style="vertical-align: top; background-color: rgb(238, 238, 238);">split<br>
      </td>
    </tr>
EOT

for i in `ls examples`
do 
  echo "<tr><td style=\"vertical-align: top; font-family: monospace;\">${i}</td>" >> regression.html
  for j in "tlm_none" "adm_split" "adm_joint"
  do 
    if [ -f examples/${i}/FAILREASON_${j} ] 
    then 
      echo "<td style=\"vertical-align: top; background-color: rgb(255, 153, 0);\">" >> regression.html 
      cat examples/$i/FAILREASON_${j} >> regression.html
      echo "</td>" >> regression.html
    else
      echo "<td style=\"vertical-align: top;\"><br></td> " >> regression.html
    fi
  done
  echo "</tr>" >> regression.html
done

cat >> regression.html <<EOT
</tbody>
</table>
</font>
</body>
</html>
EOT