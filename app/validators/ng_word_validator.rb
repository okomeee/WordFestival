class NgWordValidator < ActiveModel::EachValidator
  NG_WORDS_PATH = 'lib/ng_words'
  NG_WORDS = File.readlines(NG_WORDS_PATH).each{ |line| line.chomp! }
 
  def validate_each(record, attribute, value)
    NG_WORDS.each do |str|
      if value =~ /#{str}/
        record.errors[attribute] << (options[:message] || "の#{str}はNGワードです")
      end
    end
  end
end