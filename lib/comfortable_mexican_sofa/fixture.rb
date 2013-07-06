module ComfortableMexicanSofa::Fixture
  
  class Importer
    attr_accessor :site,
                  :path,
                  :fixture_ids,
                  :force_import
    
    def initialize(from, to = from, force_import = false)
      self.fixture_ids = []
      
      self.site = Cms::Site.where(:identifier => to).first!
      
      dir = self.class.name.split('::')[2].downcase.pluralize
      self.path = File.join(ComfortableMexicanSofa.config.fixtures_path, from, dir, '/')
      ComfortableMexicanSofa.logger.warn("Cannot find fixtures for #{dir}") unless File.directory?(self.path)
    end
    
    def fresh_fixture?(object, file_path)
      object.new_record? || File.mtime(file_path) > object.updated_at
    end
    
    def get_attributes(file_path)
      YAML.load_file(file_path).try(:symbolize_keys!) || { }
    end
  end
  
  class Exporter
    attr_accessor :site,
                  :path
    
    def initialize(from, to = from)
      self.site = Cms::Site.where(:identifier => from).first
      dir = self.class.name.split('::')[2].downcase.pluralize
      self.path = File.join(ComfortableMexicanSofa.config.fixtures_path, to, dir)
    end
    
    def prepare_folder!(path)
      FileUtils.rm_rf(path)
      FileUtils.mkdir_p(path)
    end
  end
  
  def self.import_all(from, to = from, force_import = false)
    ComfortableMexicanSofa::Fixture::Layout::Importer.new( from, to, force_import).import!
    ComfortableMexicanSofa::Fixture::Page::Importer.new(   from, to, force_import).import!
    ComfortableMexicanSofa::Fixture::Snippet::Importer.new(from, to, force_import).import!
  end
  
  def self.export_all(to, from = to)
    ComfortableMexicanSofa::Fixture::Layout::Exporter.new( from, to).export!
    ComfortableMexicanSofa::Fixture::Page::Exporter.new(   from, to).export!
    ComfortableMexicanSofa::Fixture::Snippet::Exporter.new(from, to).export!
  end
  
end