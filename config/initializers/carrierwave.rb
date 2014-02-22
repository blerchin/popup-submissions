CarrierWave.configure do |config|
	config.fog_credentials = {
		:provider						=> "AWS",
		:aws_access_key_id 	=> "AKIAIVJ326CXMIUAOYIQ",
		:aws_secret_access_key => "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",
		:region							=> "us-west-2"
	}
	config.storage = 'fog'
	config.fog_directory = 'popupuploads'
	config.fog_public = true
	config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
