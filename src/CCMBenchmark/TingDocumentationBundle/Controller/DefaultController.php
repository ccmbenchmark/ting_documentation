<?php

namespace CCMBenchmark\TingDocumentationBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        var_dump($this->container->getParameter('kernel.cache_dir'));
        return $this->render('CCMBenchmarkTingDocumentationBundle:Default:index.html.twig', array('name' => $name));
    }
}
