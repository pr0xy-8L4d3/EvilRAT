class MetasploitModule < Msf::Encoder
  Rank = NormalRanking
 
  def initialize
    super(
      'Name'             => 'Powershell Base64 Script Encoder',
      'Description'      => %q{
        PowerShell script base64 encoded and obfuscated.
      },
      'Author'           => 'Pr0xy bl4d3',
      'Arch'             => ARCH_CMD,
      'Platform'         => 'win')
 
    register_options([
      OptBool.new('NOEXIT', [ false, 'Add -noexit option', false ]),
      OptBool.new('SYSWOW64', [ false, 'Call syswow64 powershell', false ])
    ])
 
  end
 
  def encode_block(state, buf)
    base64 = Rex::Text.encode_base64(Rex::Text.to_unicode(buf))
    cmd = ''
    if datastore['SYSWOW64']
      cmd += 'c:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe '
    else
      cmd += 'powershell.exe '
    end
    if datastore['NOEXIT']
      cmd += '-W Hidden -nop -ep bypass -NoExit '
    end
    cmd += "-E #{base64}"
  end
end
