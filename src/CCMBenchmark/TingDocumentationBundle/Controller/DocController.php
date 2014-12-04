<?php

namespace CCMBenchmark\TingDocumentationBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DocController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('CCMBenchmarkTingDocumentationBundle:Doc:index.html.twig', [
            'name' => $name,
            'full_path' => '@CCMBenchmarkDocHTML/' . $name . '.html'
        ]);
    }
}
