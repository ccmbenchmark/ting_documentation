<?php


namespace CCMBenchmark\TingDocumentationBundle\RST;


class Builder extends \Gregwar\RST\Builder
{

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
            file_put_contents($target, $document->render());
        }
    }
}
