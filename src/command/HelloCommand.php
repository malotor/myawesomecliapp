<?php

namespace MyAwesomeCliApp\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputOption;

class HelloCommand extends Command
{
    protected function configure()
    {
        $this
            ->setName('hello')
            ->setDescription('Say hello')
            ->addOption(
                'yell',
                null,
                InputOption::VALUE_NONE,
                'If set, the task will yell in uppercase letters'
            )
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $text = 'Hello World';
        if ($input->getOption('yell')) {
            $text = strtoupper($text);
        }
        $output->writeln($text);
    }
}