%w[
  smbios-utils libsmbios2
  virtualbox-guest-additions virtualbox-ose-guest-utils
  virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms
].each do |pkg|
  package pkg
end