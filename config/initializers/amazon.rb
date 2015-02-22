class Amazon

  def self.bucket
    ENV['S3_BUCKET']
  end

  def self.bucket_url
    "https://#{bucket}.s3.amazonaws.com/"
  end

  def self.key
    "#{SecureRandom.uuid}/${filename}"
  end

  def self.access_key_id
    ENV['S3_ACCESS_KEY_ID']
  end

  def self.secret_access_key
    ENV['S3_SECRET_ACCESS_KEY']
  end

  def self.policy
    Base64.encode64(
      {
        expiration: 30.minutes.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z'),
        conditions: [
          { bucket: bucket },
          { acl: 'public-read' },
          { success_action_status: '201' },
          ['starts-with', '$key', '']
        ]
      }.to_json
    ).gsub(/\n|\r/, '')
  end

  def self.signature
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'), secret_access_key, policy
      )
    ).gsub(/\n/, '')
  end

end
