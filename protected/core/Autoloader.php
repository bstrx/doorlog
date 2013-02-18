<?php

class Autoloader {

    private $_fileExtension = '.php';
    private $_namespace;
    private $_includePath;
    private $_namespaceSeparator;

    public function __construct($namespace = null, $includePath = __DIR__, $namespaceSeparator = "\\") {
        $this->_namespace = $namespace;
        $this->_includePath = $includePath;
        $this->_includePath = substr($includePath, 0, (strripos($includePath, DIRECTORY_SEPARATOR)));
        $this->_namespaceSeparator = $namespaceSeparator;
    }

    /**
     * Sets the namespace separator used by classes in the namespace of this class loader.
     */
    public function setNamespaceSeparator($separator) {
        $this->_namespaceSeparator = $separator;
    }

    /**
     * Gets the namespace seperator used by classes in the namespace of this class loader.
     */
    public function getNamespaceSeparator() {
        return $this->_namespaceSeparator;
    }

    /**
     * Sets the base include path for all class files in the namespace of this class loader.
     */
    public function setIncludePath($includePath) {
        $this->_includePath = $includePath;
    }

    /**
     * Gets the base include path for all class files in the namespace of this class loader.
     */
    public function getIncludePath() {
        return $this->_includePath;
    }

    /**
     * Sets the file extension of class files in the namespace of this class loader.
     */
    public function setFileExtension($fileExtension) {
        $this->_fileExtension = $fileExtension;
    }

    /**
     * Gets the file extension of class files in the namespace of this class loader.
     */
    public function getFileExtension() {
        return $this->_fileExtension;
    }

    /**
     * Installs this class loader on the SPL autoload stack.
     */
    public function register() {
        spl_autoload_register(array($this, 'loadClass'));
    }

    /**
     * Uninstalls this class loader from the SPL autoloader stack.
     */
    public function unregister() {
        spl_autoload_unregister(array($this, 'loadClass'));
    }

    /**
     * Loads the given class or interface.
     * Сreated using standart PSR-0.
     * Сhange symbol "_" into directory separator in getting argument.
     *
     * Example:
     *     loadClass("core\Autoloader")
     *     return /var/www/doorlog/protected/core/Autoloader.php
     *
     *     loadClass("controllers\News_old")
     *     return /var/www/doorlog/protected/controllers/News/old.php
     *
     */
    public function loadClass($className) {

        $argNamespace = substr($className, 0, strlen($this->_namespace . $this->_namespaceSeparator));
        $namespace = $this->_namespace . $this->_namespaceSeparator;

        if (null === $this->_namespace || $namespace === $argNamespace ) {
            $fileName = '';
           
            if ( $lastNsPos = strripos($className, $this->_namespaceSeparator) ) {
                $namespace = substr($className, 0, $lastNsPos);
                $className = substr($className, $lastNsPos + 1);
                $fileName = str_replace($this->_namespaceSeparator, DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;
            }
           
            $fileName .= str_replace('_', DIRECTORY_SEPARATOR, $className) . $this->_fileExtension;

            if ($this->_includePath)
            {
                $path = $this->_includePath . DIRECTORY_SEPARATOR . $fileName ;
            } else {
                $path = $fileName;
            }

            if (file_exists($path))
            {
                require $path;
            }
        }
    }

}