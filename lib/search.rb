module Search
  def complete_search_by(attribute, key)
    key = downcase_key(key)
    @contacts.select { |contact| contact.send(attribute).downcase == key }
  end

  def prefix_search_by(attribute, key)
    key = downcase_key(key)
    @contacts.select { |contact| contact.send(attribute).downcase.start_with?(key) }
  end

  private

  def downcase_key(key)
    key.downcase
  end
end