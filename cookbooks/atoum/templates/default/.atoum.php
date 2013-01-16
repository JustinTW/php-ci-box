<?php
use mageekguy\atoum;

$script->addDefaultReport();

/** Xunit report */
$xunit = new atoum\reports\asynchronous\xunit();
$runner->addReport($xunit);

/** Xunit writer */
$writer = new atoum\writers\file(getcwd() . DIRECTORY_SEPARATOR . 'atoum.xunit.xml');
$xunit->addWriter($writer);

/** Clover report */
$clover = new atoum\reports\asynchronous\clover();
$runner->addReport($clover);

/** Clover report */
$writer = new atoum\writers\file(getcwd() . DIRECTORY_SEPARATOR . 'atoum.clover.xml');
$clover->addWriter($writer);