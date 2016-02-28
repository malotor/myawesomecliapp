<?php

namespace MyAwesomeCliApp\command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Herrera\Phar\Update\Manager;
use Herrera\Phar\Update\Manifest;

class UpdateCommand extends Commad
{
    const MANIFEST_FILE = 'http://malotor.github.io/myawesomecliapp/manifest.json';

    protected function configure()
    {
        $this
            ->setName('update')
            ->setDescription('Updates myawesomeapp.phar to the latest version')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $manager = new Manager(Manifest::loadFile(self::MANIFEST_FILE));
        $manager->update($this->getApplication()->getVersion(), true);
    }
}