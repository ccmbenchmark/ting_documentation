<?php


namespace AppBundle\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render(':default:index.html.twig');
    }
}
