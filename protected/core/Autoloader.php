<?php

class Autoloader {

    private $_fileExtension = '.php';
    private $_namespace;
    private $_includePath;
    private $_namespaceSeparator;

    public function __construct($namespace = null, $includePath = __DIR__, $namespaceSeparator = "\\") {
        $this->_namespace = $namespace;
        $this->_includePath = $includePath;

        // удаляем последнюю директорию core с пути и сохраняем в переменной $_includePath....
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
     */
    public function loadClass($className) {
        // если _namespace не указан или указанный соответствует полученному в аргументе то....
        if (null === $this->_namespace || $this->_namespace . $this->_namespaceSeparator === substr($className, 0, strlen($this->_namespace . $this->_namespaceSeparator))) {
            $fileName = '';
            $namespace = '';
            // если SEPARATOR содержится в полученном аргументе, то разбиваем строку на namespace и class
            if (false !== ($lastNsPos = strripos($className, $this->_namespaceSeparator))) {
                $namespace = substr($className, 0, $lastNsPos);
                $className = substr($className, $lastNsPos + 1);
                // замена заданного сепаратора на DIRECTORY_SEPARATOR в namespace
                $fileName = str_replace($this->_namespaceSeparator, DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;
            }
            // замена _ на DIRECTORY_SEPARATOR в classname 
            $fileName .= str_replace('_', DIRECTORY_SEPARATOR, $className) . $this->_fileExtension;

            $filename = ($this->_includePath !== null ? $this->_includePath . DIRECTORY_SEPARATOR : '') . $fileName;

            if (file_exists($filename)) {
                require $filename;
            }
        }
    }

}
