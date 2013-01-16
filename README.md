# PHP CI Box

## How to use

```shell
$ vagrant init php-ci http://static.jubianchi.fr/boxes/php-ci.box
$ cat Vagrantfile
Vagrant::Config.run do |config|
    config.vm.box = "php-ci"
    config.vm.box_url = "http://static.jubianchi.fr/boxes/php-ci.box"
end

$ vagrant up
```

## What is installed

<table>
<thead><tr><th>Utility</th><th>Version</th></thead><tbody>
<tr><th>PHP (system default)</th><td>PHP 5.3.10-1ubuntu3.4 with Suhosin-Patch (cli) (built: Sep 12 2012 19:00:43)<br />
Copyright (c) 1997-2012 The PHP Group<br />
Zend Engine v2.3.0, Copyright (c) 1998-2012 Zend Technologies<br />
    with Xdebug v2.2.1, Copyright (c) 2002-2012, by Derick Rethans</td></tr>
<tr><th>atoum</th><td>atoum version DEVELOPMENT by Frédéric Hardy (/usr/share/atoum)</td></tr>
<tr><th>PHPMD</th><td>PHPMD 1.4.1 by Manuel Pichler</td></tr>
<tr><th>PHP_Depend</th><td>PHP_Depend 1.1.1snapshot201209122131 by Manuel Pichler</td></tr>
<tr><th>PHP_CodeSniffer</th><td>PHP_CodeSniffer version 1.4.3 (stable) by Squiz Pty Ltd. (http://www.squiz.com.au)</td></tr>
<tr><th>phpswitch</th><td>phpswitch version 0.1</td></tr>
<tr><th>Phing</th><td>Phing 2.5.0snapshot20130114220625</td></tr>
<tr><th>PHPUnit</th><td>PHPUnit 3.7.13 by Sebastian Bergmann.</td></tr>
</tbody></table>


## PHP versions

```shell
# Switch PHP version
$ source /usr/share/phpswitch/.phpswitch/.phpswitchrc
$ php switch php-<version>

# Restore default PHP version
$ php switch off
```

<table>
    <thead>
        <tr>
            <th>Version</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>php-5.3.19</th>
            <td>
                PHP 5.3.19 (cli) (built: Dec 28 2012 15:06:07)<br/>
                Copyright (c) 1997-2012 The PHP Group<br/>
                Zend Engine v2.3.0, Copyright (c) 1998-2012 Zend Technologies<br/>
            </td>
        </tr>
        <tr>
            <th>php-5.4.9</th>
            <td>
                PHP 5.4.9 (cli) (built: Dec 28 2012 15:09:00)<br/>
                Copyright (c) 1997-2012 The PHP Group<br/>
                Zend Engine v2.4.0, Copyright (c) 1998-2012 Zend Technologies<br/>
            </td>
        </tr>
    </tbody>
<table>

## You'll also find...

* Sonar v3.3 ([http://localhost:9001/](http://localhost:9001)) with PHP plugin ([jubianchi/sonar-php](https://github.com/jubianchi/sonar-php))
* Jenkins v1.491 ([http://localhost:8181/](http://localhost:8181))