import configparser
class PropertiesReader:
    def __init__(self):
        self.config = configparser.ConfigParser()
        self.config.read("./setting.conf")
    def get(self, section, name):
        return self.config[section][name]
