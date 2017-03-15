require 'rex/parser/unattend'
require 'rexml/document'

dj = REXML::Document.new('<?xml version="1.0" encoding="utf-8"?><unattend xmlns="urn:schemas-microsoft-com:unattend">    <settings pass="specialize">        <component name="Microsoft-Windows-UnattendedJoin" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">            <Identification>                <UnsecureJoin>false</UnsecureJoin>                <Credentials>                    <Domain>Fabrikam.com</Domain>                    <Password>Password1</Password>                    <Username>MyUserName</Username>                </Credentials>            </Identification>        </component>        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">            <ComputerName>%MACHINENAME%</ComputerName>        </component>    </settings></unattend>')

lng = REXML::Document.new('<?xml version="1.0" encoding="utf-8"?><unattend xmlns="urn:schemas-microsoft-com:unattend">    <settings pass="specialize">        <component name="Microsoft-Windows-UnattendedJoin" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">            <Identification>                <UnsecureJoin>false</UnsecureJoin>                <Credentials>                    <Domain>Fabrikam.com</Domain>                    <Password>Password1</Password>                    <Username>MyUserName</Username>                </Credentials>            </Identification>        </component>        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">            <ComputerName>%MACHINENAME%</ComputerName>        </component>    </settings></unattend>')

std = REXML::Document.new('<?xml version="1.0" ?> <unattend xmlns="urn:schemas-microsoft-com:unattend">   <settings pass="windowsPE">      <component name="Microsoft-Windows-Setup" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">         <WindowsDeploymentServices>            <Login>               <WillShowUI>OnError</WillShowUI>               <Credentials>                     <Username>username</Username>                     <Domain>Fabrikam.com</Domain>                     <Password>my_password</Password>                  </Credentials>               </Login>            <ImageSelection>               <WillShowUI>OnError</WillShowUI>               <InstallImage>                  <ImageName>Windows Vista with Office</ImageName>                  <ImageGroup>ImageGroup1</ImageGroup>                  <Filename>Install.wim</Filename>               </InstallImage>                  <InstallTo>                  <DiskID>0</DiskID>                  <PartitionID>1</PartitionID>               </InstallTo>            </ImageSelection>         </WindowsDeploymentServices>         <DiskConfiguration>            <WillShowUI>OnError</WillShowUI>               <Disk>                  <DiskID>0</DiskID>                  <WillWipeDisk>false</WillWipeDisk>                  <ModifyPartitions>                     <ModifyPartition>                        <Order>1</Order>                        <PartitionID>1</PartitionID>                        <Letter>C</Letter>                        <Label>TestOS</Label>                        <Format>NTFS</Format>                        <Active>true</Active>                        <Extend>false</Extend>                     </ModifyPartition>                  </ModifyPartitions>            </Disk>         </DiskConfiguration>      </component>      <component name="Microsoft-Windows-International-Core-WinPE" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">         <SetupUILanguage>            <WillShowUI>OnError</WillShowUI>            <UILanguage>en-US</UILanguage>         </SetupUILanguage>         <UILanguage>en-US</UILanguage>      </component>   </settings></unattend> ')

unsecure = REXML::Document.new('<?xml version="1.0" encoding="utf-8"?><unattend xmlns="urn:schemas-microsoft-com:unattend">    <settings pass="specialize">        <component name="Microsoft-Windows-UnattendedJoin" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">            <Identification>                <UnsecureJoin>true</UnsecureJoin>            </Identification>        </component>        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">            <ProductKey>XXXX-XXXX-XXXX-XXXX-XXXX</ProductKey>        </component>    </settings></unattend>')

b64 = REXML::Document.new('<?xml version="1.0" encoding="utf-8"?>    <unattend xmlns="urn:schemas-microsoft-com:unattend">        <settings pass="oobeSystem">            <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">                <AutoLogon>                    <Password>                        <Value>VABlAG0AcAAxADIAMwBQAGEAcwBzAHcAbwByAGQA</Value>                        <PlainText>false</PlainText>                    </Password>                    <Enabled>true</Enabled>                    <Username>Administrator</Username>                </AutoLogon>                <FirstLogonCommands>                    <SynchronousCommand wcm:action="add">                        <Order>1</Order>                        <CommandLine>powershell.exe -command {Set-ExecutionPolicy Unrestricted}</CommandLine>                    </SynchronousCommand>                    <SynchronousCommand wcm:action="add">                        <Order>2</Order>                        <CommandLine>powershell.exe -file &quot;c:\Windows\System32\sysprep\2K12-1-rename.ps1&quot;</CommandLine>                    </SynchronousCommand>                </FirstLogonCommands>                <OOBE>                    <HideEULAPage>true</HideEULAPage>                    <HideOEMRegistrationScreen>true</HideOEMRegistrationScreen>                    <HideLocalAccountScreen>true</HideLocalAccountScreen>                    <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE>                    <HideOnlineAccountScreens>true</HideOnlineAccountScreens>                    <NetworkLocation>Work</NetworkLocation>                    <SkipMachineOOBE>true</SkipMachineOOBE>                    <SkipUserOOBE>true</SkipUserOOBE>                </OOBE>                <UserAccounts>                    <AdministratorPassword>                        <Value>VABlAG0AcAAxADIAMwBBAGQAbQBpAG4AaQBzAHQAcgBhAHQAbwByAFAAYQBzAHMAdwBvAHIAZAA=</Value>                        <PlainText>false</PlainText>                    </AdministratorPassword>                </UserAccounts>            </component>        </settings>        <cpi:offlineImage cpi:source="wim:c:/users/administrator/desktop/2k12-install.wim#Windows Server 2012 SERVERSTANDARD" xmlns:cpi="urn:schemas-microsoft-com:cpi" />    </unattend>')

comb = REXML::Document.new('<unattend xmlns="urn:schemas-microsoft-com:unattend"> <settings pass="windowsPE">       <component name="Microsoft-Windows-Setup" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">             <WindowsDeploymentServices>                      <Login>                          <WillShowUI>OnError</WillShowUI>                      <Credentials>                              <Username>Administrator</Username>                             <Domain>Fabrikam.com</Domain>                           <Password>Password1</Password>                          </Credentials>                      </Login>                  <ImageSelection>                          <InstallImage>                             <ImageName>Install Image</ImageName>                           <ImageGroup>defaultx86</ImageGroup>                              <Filename>install.wim</Filename>                          </InstallImage>                        <WillShowUI>OnError</WillShowUI>                        <InstallTo>                              <DiskID>0</DiskID>                              <PartitionID>1</PartitionID>                        </InstallTo>                  </ImageSelection>            </WindowsDeploymentServices>            <DiskConfiguration>                   <WillShowUI>OnError</WillShowUI>                   <Disk>                         <DiskID>0</DiskID>                         <WillWipeDisk>false</WillWipeDisk>                         <ModifyPartitions>                               <ModifyPartition>                                     <Order>1</Order>                                      <PartitionID>1</PartitionID>                                     <Letter>C</Letter>                                     <Label>Vista</Label>                                     <Format>NTFS</Format>                                     <Active>true</Active>                                     <Extend>false</Extend>                               </ModifyPartition>                         </ModifyPartitions>                   </Disk>             </DiskConfiguration>       </component>       <component name="Microsoft-Windows-International-Core-WinPE" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">            <SetupUILanguage>                  <WillShowUI>OnError</WillShowUI>                  <UILanguage>en-US</UILanguage>            </SetupUILanguage>            <UILanguage>en-US</UILanguage>      </component></settings><settings pass="specialize">      <component name="Microsoft-Windows-UnattendedJoin" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">            <Identification>                  <UnsecureJoin>true</UnsecureJoin>              </Identification>      </component>      <component name="Microsoft-Windows-Shell-Setup" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">            <ComputerName>computer1</ComputerName>      </component>      <component name="Microsoft-Windows-TerminalServices-RDP-WinStationExtensions" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">            <SecurityLayer>2</SecurityLayer>            <UserAuthentication>2</UserAuthentication>      </component>      <component name="Microsoft-Windows-TerminalServices-LocalSessionManager" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">            <fDenyTSConnections>false</fDenyTSConnections>      </component></settings><settings pass="oobeSystem">      <component name="Microsoft-Windows-Shell-Setup" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86">            <OOBE>                   <HideEULAPage>true</HideEULAPage>                   <NetworkLocation>Work</NetworkLocation>                   <ProtectYourPC>1</ProtectYourPC>                  <SkipMachineOOBE>true</SkipMachineOOBE>                   <SkipUserOOBE>true</SkipUserOOBE>             </OOBE>             <Display>                  <ColorDepth>32</ColorDepth>                  <DPI>96</DPI>                  <HorizontalResolution>1024</HorizontalResolution>                  <RefreshRate>60</RefreshRate>                  <VerticalResolution>768</VerticalResolution>            </Display>            <UserAccounts>                  <LocalAccounts>                        <LocalAccount>                              <Password>                                    <Value>Password1</Value>                                    <PlainText>true</PlainText>                              </Password>                              <Description>My Local Account</Description>                              <DisplayName>John Smith</DisplayName>                              <Group>Administrators;Power Users</Group>                              <Name>John</Name>                        </LocalAccount>                  </LocalAccounts>                  <DomainAccounts>                              <DomainAccountList>                              <DomainAccount>                                    <Name>Administrator</Name>                                    <Group>Administrators;Power Users</Group>                              </DomainAccount>                              <Domain>Fabrikam.com</Domain>                        </DomainAccountList>                  </DomainAccounts>            </UserAccounts>      </component></settings></unattend>')

describe Rex::Parser::Unattend do

  context "#parse" do
    it "returns passwords for b64" do
      results = described_class.parse(b64)
      results.length.should eq(2)
      results[0]['password'].should eq(Rex::Text.to_unicode('Temp123'))
    end

    it "returns passwords for domain join" do
      results = described_class.parse(dj)
      results.length.should eq(1)
      results[0]['password'].should eq('Password1')
    end

    pos_xmls = [dj, b64, comb, std, lng]

    neg_xmls = [unsecure]

    it "returns results for all positive examples" do
      pos_xmls.each do |xml|
        results = described_class.parse(xml)
        results.should_not be_empty
      end
    end

    it "returns no results for negative examples" do
      neg_xmls.each do |xml|
        results = described_class.parse(xml)
        results.should be_empty
      end
    end
  end
end

