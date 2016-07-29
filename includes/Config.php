<?php

class Config {
	private $config_path = ".config";

	public function __construct(){
		
        $config_lines = file($this->config_path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($config_lines as $lines){
            $line = explode("=",$lines);
            // define($line[0],$line[1]);
            $this->{$line[0]} = $line[1];
        }
	}

	public function __get($key){
		if(property_exists($this, $key)){
            return $this->{$key};
        } else {
            return null;
        }
	}

	public function __set($key, $value){
		$this->{$key} = $value;
	}

	public function set($key, $value){
		$config_lines = file($this->config_path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        $new_config = [];
		foreach($config_lines as $lines){
			$line = explode("=",$lines);

			if($line[0] == $key){
				$new_config[] = $line[0] . "=" . $value;
			} else {
				$new_config[] = $lines;
			}
		}
		$this->{$key} = $value;
		file_put_contents($this->config_path, implode("\n", $new_config));
	}
}
