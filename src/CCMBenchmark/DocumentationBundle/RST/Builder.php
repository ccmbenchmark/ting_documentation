<?php


namespace CCMBenchmark\DocumentationBundle\RST;


use Gregwar\RST\Document;

class Builder extends \Gregwar\RST\Builder
{
    public static $baseDirectory = null;

    /**
     * Renders all the pending documents
     */
    protected function render()
    {
        $this->display('* Rendering documents');
        foreach ($this->documents as $file => &$document) {
            /**
             * @var $document \Gregwar\RST\Document
             */
            $this->display(' -> Rendering '.$file.'...');
            $target = $this->getTargetOf($file);
            $directory = dirname($target);

            if (!is_dir($directory)) {
                mkdir($directory, 0755, true);
            }

            file_put_contents($target.'.twig', $this->parseAnchors($document));
        }
    }

    protected function parseAnchors(Document $document)
    {
        $html = preg_replace_callback(
            '/href="([-a-z\/0-9]+)\.html"/',
            function ($match) use ($document) {
                $file = str_replace(
                    self::$baseDirectory . '/',
                    '',
                    $document->getEnvironment()->absoluteRelativePath($match[1])
                );
                $file = preg_replace('#/+#', '/', $file);
                return 'href="{{ path(\'ccm_benchmark_documentation_page\', {name: "'.$file.'"}) }}"';
            },
            $document->render()
        );
        return $html;
    }
}
