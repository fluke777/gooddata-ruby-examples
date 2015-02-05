# encoding: utf-8

require 'erb'
require 'pathname'
require 'pry'

class ErbHelper
  BASE_DIR = File.join(File.dirname(__FILE__), '..')

  def grab_files
    # FILES = [
    #   './src/_general/*.rb.erb',
    #   './**/*.rb.erb',
    #   './**/*.asciidoc.erb',
    # ]

    FileList["**/*.erb"] - FileList['book_src/**/*'] - FileList['data/**/*'] - FileList['tmp/**/*']
  end

  def clean
    grab_files.each do |files|
      
      Dir[files].each do |f|
        tfile = f.gsub(/\.erb/, '')
        if File.exist? tfile
          puts "Deleting #{tfile}"
          FileUtils.rm_rf tfile
        end
      end
    end
  end

  def clean_source
    grab_files.each do |files|
      
      Dir[files].each do |f|
        tfile = f.gsub(/\.erb/, '')
        if File.exist? tfile
          puts "Deleting #{f}"
          FileUtils.rm_rf f
        end
      end
    end
  end

  def render(filename)
    path = File.join(BASE_DIR, filename)
    File.read(path)
  end

  def render_ruby(filename)
    render_source('ruby', filename)
  end

  def render_source(type, filename)
    b = binding

    content = render(filename) do
      yield if block_given?
    end

    erb = ERB.new(content)
    erb.filename = filename
    res = erb.result b

    "[source,#{type}]\n----\n#{res}\n----"
  end

  def process(files)
    b = binding
    Dir[files].each do |filename|
      erb = ERB.new(File.read(filename))
      erb.filename = filename

      res = erb.result b
      File.open(filename.gsub(/\.erb/, ''), 'wt') do |f|
        puts "Processing #{filename}"
        f.write res.chomp
      end
    end
  end


  def run
    grab_files.each do |files|
      process(files)
    end
  end
end
