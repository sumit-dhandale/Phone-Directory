module Search
  def complete_search_by_first_name(key)
    key = downcase_key(key)
    contacts = @contacts.select { |contact| contact.first_name.downcase == key }
    puts contacts
    return contacts
  end

  def complete_search_by_last_name(key)
    key = downcase_key(key)
    contacts = @contacts.select { |contact| contact.last_name.downcase == key }
    puts contacts
    return contacts
  end

  def complete_search_by_phone_number(key)
    key = downcase_key(key)
    contacts = @contacts.select { |contact| contact.last_name.downcase == key }
    puts contacts
    return contacts
  end

  def prefix_search_by_first_name(key)
    key = downcase_key(key)
    contacts = @contacts.select { |contact| contact.first_name.downcase.start_with?(key) }
    puts contacts
    return contacts
  end

  def prefix_search_by_last_name(key)
    key = downcase_key(key)
    contacts = @contacts.select { |contact| contact.last_name.downcase.start_with?(key) }
    puts contacts
    return contacts
  end

  def prefix_search_by_phone_number(key)
    key = downcase_key(key)
    contacts = @contacts.select { |contact| contact.last_name.downcase.start_with?(key) }
    puts contacts
    return contacts
  end

  private

  def downcase_key(key)
    key.to_str.downcase
  end
end