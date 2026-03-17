Facter.add(:webisonline) do
  setcode do
    default='web_is_online'
    wartung='wartung'
    if File.exist?('/tmp/wartung')
      wartung
    else
      default
    end
  end
end
