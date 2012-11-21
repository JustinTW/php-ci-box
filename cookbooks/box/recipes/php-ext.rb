include_recipe "php"

package "imagemagick"
package "libmagickcore-dev"
package "libmagickwand-dev"

php_pear "xdebug" do
  zend_extensions ['xdebug.so']
  action :install
end
