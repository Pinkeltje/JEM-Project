<?php
namespace Joomla\Plugin\Finder\Jem\Extension;

defined('_JEXEC') or die;

use Joomla\CMS\Extension\PluginInterface;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\DI\Container;
use Joomla\DI\ServiceProviderInterface;
use Joomla\Event\DispatcherInterface;
use Joomla\Plugin\Finder\Jem\Extension\Jem;

return new class implements ServiceProviderInterface
{
    public function register(Container $container)
    {
        $container->set(
            PluginInterface::class,
            function (Container $container) {
                $plugin = new Jem(
                    $container->get(DispatcherInterface::class),
                    (array) PluginHelper::getPlugin('finder', 'jem')
                );
                $plugin->setApplication(\Joomla\CMS\Factory::getApplication());

                return $plugin;
            }
        );
    }
};