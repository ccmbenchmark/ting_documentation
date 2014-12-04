<?php


namespace CCMBenchmark\TingDocumentationBundle\Warmer;


use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpKernel\CacheWarmer\CacheWarmerInterface;

class DocumentationWarmer implements CacheWarmerInterface
{
    protected $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    /**
     * Checks whether this warmer is optional or not.
     *
     * Optional warmers can be ignored on certain conditions.
     *
     * A warmer should return true if the cache can be
     * generated incrementally and on-demand.
     *
     * @return bool true if the warmer is optional, false otherwise
     */
    public function isOptional()
    {
        return false;
    }

    /**
     * @param string $cacheDir
     * @throws \Exception
     */
    public function warmUp($cacheDir)
    {
        $directory = $this->container->get('fileLocator')->locate(
            $this->container->getParameter('ccm_benchmark_ting_documentation.doc_path')
        );

        $this->buildDirectory($directory, $cacheDir . '/doc');
    }

    protected function buildDirectory($input, $output)
    {
        $builder = new \CCMBenchmark\TingDocumentationBundle\RST\Builder();
        $builder->build($input, $output, true);

        foreach (glob($input.'/*', GLOB_ONLYDIR) as $folder) {
            $this->buildDirectory($folder, $output.'/'.basename($folder));
        }
    }
}
