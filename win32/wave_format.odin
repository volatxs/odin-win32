package win32

// From WAVE_FORMAT_XXX
Wave_Format :: enum dword {
	// From WAVE_FORMAT_UNKNOWN (Microsoft Corporation)
	Unknown = 0x0000,
	// From WAVE_FORMAT_PCM
	PCM = 1,
	// From WAVE_FORMAT_ADPCM (Microsoft Corporation)
	ADPCM = 0x0002,
	// From WAVE_FORMAT_IEEE_FLOAT (Microsoft Corporation)
	IEEE_Float = 0x0003,
	// From WAVE_FORMAT_VSELP (Compaq Computer Corp.)
	VSELP = 0x0004,
	// From WAVE_FORMAT_IBM_CVSD (IBM Corporation)
	IBM_CVSD = 0x0005,
	// From WAVE_FORMAT_ALAW (Microsoft Corporation)
	A_Law = 0x0006,
	// From WAVE_FORMAT_MULAW (Microsoft Corporation)
	Mu_Law = 0x0007,
	// From WAVE_FORMAT_DTS (Microsoft Corporation)
	DTS = 0x0008,
	// From WAVE_FORMAT_DRM (Microsoft Corporation)
	DRM = 0x0009,
	// From WAVE_FORMAT_WMAVOICE9 (Microsoft Corporation)
	WMA_Voice_9 = 0x000A,
	// From WAVE_FORMAT_WMAVOICE10 (Microsoft Corporation)
	WMA_Voice_10 = 0x000B,
	// From WAVE_FORMAT_OKI_ADPCM (OKI)
	OKI_ADPCM = 0x0010,
	// From WAVE_FORMAT_DVI_ADPCM (Intel Corporation)
	DVI_ADPCM = 0x0011,
	// From WAVE_FORMAT_IMA_ADPCM  Intel Corporation)
	IMA_ADPCM = DVI_ADPCM,
	// From WAVE_FORMAT_MEDIASPACE_ADPCM (Videologic)
	Media_Space_ADPCM = 0x0012,
	// From WAVE_FORMAT_SIERRA_ADPCM (Sierra Semiconductor Corp)
	Sierra_ADPCM = 0x0013,
	// From WAVE_FORMAT_G723_ADPCM (Antex Electronics Corporation)
	G723_ADPCM = 0x0014,
	// From WAVE_FORMAT_DIGISTD (DSP Solutions, Inc.)
	DIGISTD = 0x0015,
	// From WAVE_FORMAT_DIGIFIX (DSP Solutions, Inc.)
	DIGIFIX = 0x0016,
	// From WAVE_FORMAT_DIALOGIC_OKI_ADPCM (Dialogic Corporation)
	Dialogic_OKI_ADPCM = 0x0017,
	// From WAVE_FORMAT_MEDIAVISION_ADPCM (Media Vision, Inc.)
	Media_Vision_ADPCM = 0x0018,
	// From WAVE_FORMAT_CU_CODEC (Hewlett-Packard Company)
	CU_Codec = 0x0019,
	// From WAVE_FORMAT_HP_DYN_VOICE (Hewlett-Packard Company)
	HP_Dyn_Voice = 0x001A,
	// From WAVE_FORMAT_YAMAHA_ADPCM (Yamaha Corporation of America)
	Yamaha_ADPCM = 0x0020,
	// From WAVE_FORMAT_SONARC (Speech Compression)
	SonARC = 0x0021,
	// From WAVE_FORMAT_DSPGROUP_TRUESPEECH (DSP Group, Inc)
	DSP_Group_Truespeech = 0x0022,
	// From WAVE_FORMAT_ECHOSC1 (Echo Speech Corporation)
	Echo_SC1 = 0x0023,
	// From WAVE_FORMAT_AUDIOFILE_AF36 (Virtual Music, Inc.)
	Audiofile_AF36 = 0x0024,
	// From WAVE_FORMAT_APTX (Audio Processing Technology)
	aptX = 0x0025,
	// From WAVE_FORMAT_AUDIOFILE_AF10 (Virtual Music, Inc.)
	Audiofile_AF10 = 0x0026,
	// From WAVE_FORMAT_PROSODY_1612 (Aculab plc)
	Prosody_1612 = 0x0027,
	// From WAVE_FORMAT_LRC (Merging Technologies S.A.)
	LRC = 0x0028,
	// From WAVE_FORMAT_DOLBY_AC2 (Dolby Laboratories)
	Dolby_AC2 = 0x0030,
	// From WAVE_FORMAT_GSM610 (Microsoft Corporation)
	GSM610 = 0x0031,
	// From WAVE_FORMAT_MSNAUDIO (Microsoft Corporation)
	MSN_Audio = 0x0032,
	// From WAVE_FORMAT_ANTEX_ADPCME (Antex Electronics Corporation)
	Antex_ADPCME = 0x0033,
	// From WAVE_FORMAT_CONTROL_RES_VQLPC (Control Resources Limited)
	Control_Res_VQLPC = 0x0034,
	// From WAVE_FORMAT_DIGIREAL (DSP Solutions, Inc.)
	DIGIREAL = 0x0035,
	// From WAVE_FORMAT_DIGIADPCM (DSP Solutions, Inc.)
	DIGIADPCM = 0x0036,
	// From WAVE_FORMAT_CONTROL_RES_CR10 (Control Resources Limited)
	Control_Res_CR10 = 0x0037,
	// From WAVE_FORMAT_NMS_VBXADPCM (Natural MicroSystems)
	NMS_VBXADPCM = 0x0038,
	// From WAVE_FORMAT_CS_IMAADPCM (Crystal Semiconductor IMA ADPCM)
	CS_IMAADPCM = 0x0039,
	// From WAVE_FORMAT_ECHOSC3 (Echo Speech Corporation)
	Echo_SC3 = 0x003A,
	// From WAVE_FORMAT_ROCKWELL_ADPCM (Rockwell International)
	Rockwell_ADPCM = 0x003B,
	// From WAVE_FORMAT_ROCKWELL_DIGITALK (Rockwell International)
	Rockwell_Digitalk = 0x003C,
	// From WAVE_FORMAT_XEBEC (Xebec Multimedia Solutions Limited)
	Xebec = 0x003D,
	// From WAVE_FORMAT_G721_ADPCM (Antex Electronics Corporation)
	G721_ADPCM = 0x0040,
	// From WAVE_FORMAT_G728_CELP (Antex Electronics Corporation)
	G728_CELP = 0x0041,
	// From WAVE_FORMAT_MSG723 (Microsoft Corporation)
	MSG723 = 0x0042,
	// From WAVE_FORMAT_INTEL_G723_1 (Intel Corp.)
	Intel_G723_1 = 0x0043,
	// From WAVE_FORMAT_INTEL_G729 (Intel Corp.)
	Intel_G729 = 0x0044,
	// From WAVE_FORMAT_SHARP_G726 (Sharp)
	Sharp_G726 = 0x0045,
	// From WAVE_FORMAT_MPEG (Microsoft Corporation)
	MPEG = 0x0050,
	// From WAVE_FORMAT_RT24 (InSoft, Inc.)
	RT24 = 0x0052,
	// From WAVE_FORMAT_PAC (InSoft, Inc.)
	PAC = 0x0053,
	// From WAVE_FORMAT_MPEGLAYER3 (ISO/MPEG Layer3 Format Tag)
	MPEG_Layer3 = 0x0055,
	// From WAVE_FORMAT_LUCENT_G723 (Lucent Technologies)
	Lucent_G723 = 0x0059,
	// From WAVE_FORMAT_CIRRUS (Cirrus Logic)
	Cirrus = 0x0060,
	// From WAVE_FORMAT_ESPCM (ESS Technology)
	ESPCM = 0x0061,
	// From WAVE_FORMAT_VOXWARE (Voxware Inc)
	Voxware = 0x0062,
	// From WAVE_FORMAT_CANOPUS_ATRAC (Canopus, co., Ltd.)
	Canopus_ATRAC = 0x0063,
	// From WAVE_FORMAT_G726_ADPCM (APICOM)
	G726_ADPCM = 0x0064,
	// From WAVE_FORMAT_G722_ADPCM (APICOM)
	G722_ADPCM = 0x0065,
	// From WAVE_FORMAT_DSAT (Microsoft Corporation)
	DSAT = 0x0066,
	// From WAVE_FORMAT_DSAT_DISPLAY (Microsoft Corporation)
	DSAT_Display = 0x0067,
	// From WAVE_FORMAT_VOXWARE_BYTE_ALIGNED (Voxware Inc)
	Voxware_Byte_Aligned = 0x0069,
	// From WAVE_FORMAT_VOXWARE_AC8 (Voxware Inc)
	Voxware_AC8 = 0x0070,
	// From WAVE_FORMAT_VOXWARE_AC10 (Voxware Inc)
	Voxware_AC10 = 0x0071,
	// From WAVE_FORMAT_VOXWARE_AC16 (Voxware Inc)
	Voxware_AC16 = 0x0072,
	// From WAVE_FORMAT_VOXWARE_AC20 (Voxware Inc)
	Voxware_AC20 = 0x0073,
	// From WAVE_FORMAT_VOXWARE_RT24 (Voxware Inc)
	Voxware_RT24 = 0x0074,
	// From WAVE_FORMAT_VOXWARE_RT29 (Voxware Inc)
	Voxware_RT29 = 0x0075,
	// From WAVE_FORMAT_VOXWARE_RT29HW (Voxware Inc)
	Voxware_RT29HW = 0x0076,
	// From WAVE_FORMAT_VOXWARE_VR12 (Voxware Inc)
	Voxware_VR12 = 0x0077,
	// From WAVE_FORMAT_VOXWARE_VR18 (Voxware Inc)
	Voxware_VR18 = 0x0078,
	// From WAVE_FORMAT_VOXWARE_TQ40 (Voxware Inc)
	Voxware_TQ40 = 0x0079,
	// From WAVE_FORMAT_VOXWARE_SC3 (Voxware Inc)
	Voxware_SC3 = 0x007A,
	// From WAVE_FORMAT_VOXWARE_SC3_1 (Voxware Inc)
	Voxware_SC3_1 = 0x007B,
	// From WAVE_FORMAT_SOFTSOUND (Softsound, Ltd.)
	Softsound = 0x0080,
	// From WAVE_FORMAT_VOXWARE_TQ60 (Voxware Inc)
	Voxware_TQ60 = 0x0081,
	// From WAVE_FORMAT_MSRT24 (Microsoft Corporation)
	MSRT24 = 0x0082,
	// From WAVE_FORMAT_G729A (AT&T Labs, Inc.)
	G729A = 0x0083,
	// From WAVE_FORMAT_MVI_MVI2 (Motion Pixels)
	MVI_MVI2 = 0x0084,
	// From WAVE_FORMAT_DF_G726 (DataFusion Systems (Pty) (Ltd))
	DF_G726 = 0x0085,
	// From WAVE_FORMAT_DF_GSM610 (DataFusion Systems (Pty) (Ltd))
	DF_GSM610 = 0x0086,
	// From WAVE_FORMAT_ISIAUDIO (Iterated Systems, Inc.)
	ISI_Audio = 0x0088,
	// From WAVE_FORMAT_ONLIVE (OnLive! Technologies, Inc.)
	On_Live = 0x0089,
	// From WAVE_FORMAT_MULTITUDE_FT_SX20 (Multitude Inc.)
	Multitude_FT_SX20 = 0x008A,
	// From WAVE_FORMAT_INFOCOM_ITS_G721_ADPCM (Infocom)
	Infocom_ITS_G721_ADPCM = 0x008B,
	// From WAVE_FORMAT_CONVEDIA_G729 (Convedia Corp.)
	Convedia_G729 = 0x008C,
	// From WAVE_FORMAT_CONGRUENCY (Congruency Inc.)
	Congruency = 0x008D,
	// From WAVE_FORMAT_SBC24 (Siemens Business Communications Sys)
	SBC24 = 0x0091,
	// From WAVE_FORMAT_DOLBY_AC3_SPDIF (Sonic Foundry)
	Dolby_AC3_SPDIF = 0x0092,
	// From WAVE_FORMAT_MEDIASONIC_G723 (MediaSonic)
	Mediasonic_G723 = 0x0093,
	// From WAVE_FORMAT_PROSODY_8KBPS (Aculab plc)
	Prosody_8KBPS = 0x0094,
	// From WAVE_FORMAT_ZYXEL_ADPCM (ZyXEL Communications, Inc.)
	Zyxel_ADPCM = 0x0097,
	// From WAVE_FORMAT_PHILIPS_LPCBB (Philips Speech Processing)
	Philips_LPCBB = 0x0098,
	// From WAVE_FORMAT_PACKED (Studer Professional Audio AG)
	Packed = 0x0099,
	// From WAVE_FORMAT_MALDEN_PHONYTALK (Malden Electronics Ltd.)
	Malden_Phonytalk = 0x00A0,
	// From WAVE_FORMAT_RACAL_RECORDER_GSM (Racal recorders)
	Racal_Recorder_GSM = 0x00A1,
	// From WAVE_FORMAT_RACAL_RECORDER_G720_A (Racal recorders)
	Racal_Recorder_G720_A = 0x00A2,
	// From WAVE_FORMAT_RACAL_RECORDER_G723_1 (Racal recorders)
	Racal_Recorder_G723_1 = 0x00A3,
	// From WAVE_FORMAT_RACAL_RECORDER_TETRA_ACELP (Racal recorders)
	Racal_Recorder_Tetra_ACELP = 0x00A4,
	// From WAVE_FORMAT_NEC_AAC (NEC Corp.)
	NEC_AAC = 0x00B0,
	// From WAVE_FORMAT_RAW_AAC1 (For Raw AAC, with format block AudioSpecificConfig() (as defined by MPEG-4), that follows WAVEFORMATEX)
	Raw_AAC1 = 0x00FF,
	// From WAVE_FORMAT_RHETOREX_ADPCM (Rhetorex Inc.)
	Rhetorex_ADPCM = 0x0100,
	// From WAVE_FORMAT_IRAT (BeCubed Software Inc.)
	IRAT = 0x0101,
	// From WAVE_FORMAT_VIVO_G723 (Vivo Software)
	Vivo_G723 = 0x0111,
	// From WAVE_FORMAT_VIVO_SIREN (Vivo Software)
	Vivo_Siren = 0x0112,
	// From WAVE_FORMAT_PHILIPS_CELP (Philips Speech Processing)
	Philips_CELP = 0x0120,
	// From WAVE_FORMAT_PHILIPS_GRUNDIG (Philips Speech Processing)
	Philips_GRUNDIG = 0x0121,
	// From WAVE_FORMAT_DIGITAL_G723 (Digital Equipment Corporation)
	Digital_G723 = 0x0123,
	// From WAVE_FORMAT_SANYO_LD_ADPCM (Sanyo Electric Co., Ltd.)
	Sanyo_LD_ADPCM = 0x0125,
	// From WAVE_FORMAT_SIPROLAB_ACEPLNET (Sipro Lab Telecom Inc.)
	Sipro_Lab_ACEPLNET = 0x0130,
	// From WAVE_FORMAT_SIPROLAB_ACELP4800 (Sipro Lab Telecom Inc.)
	Sipro_Lab_ACELP4800 = 0x0131,
	// From WAVE_FORMAT_SIPROLAB_ACELP8V3 (Sipro Lab Telecom Inc.)
	Sipro_Lab_ACELP8V3 = 0x0132,
	// From WAVE_FORMAT_SIPROLAB_G729 (Sipro Lab Telecom Inc.)
	Sipro_Lab_G729 = 0x0133,
	// From WAVE_FORMAT_SIPROLAB_G729A (Sipro Lab Telecom Inc.)
	Sipro_Lab_G729A = 0x0134,
	// From WAVE_FORMAT_SIPROLAB_KELVIN (Sipro Lab Telecom Inc.)
	Sipro_Lab_Kelvin = 0x0135,
	// From WAVE_FORMAT_VOICEAGE_AMR (VoiceAge Corp.)
	Voice_Age_AMR = 0x0136,
	// From WAVE_FORMAT_G726ADPCM (Dictaphone Corporation)
	G726ADPCM = 0x0140,
	// From WAVE_FORMAT_DICTAPHONE_CELP68 (Dictaphone Corporation)
	Dictaphone_CELP68 = 0x0141,
	// From WAVE_FORMAT_DICTAPHONE_CELP54 (Dictaphone Corporation)
	Dictaphone_CELP54 = 0x0142,
	// From WAVE_FORMAT_QUALCOMM_PUREVOICE (Qualcomm, Inc.)
	Qualcomm_Purevoice = 0x0150,
	// From WAVE_FORMAT_QUALCOMM_HALFRATE (Qualcomm, Inc.)
	Qualcomm_Halfrate = 0x0151,
	// From WAVE_FORMAT_TUBGSM (Ring Zero Systems, Inc.)
	TUB_GSM = 0x0155,
	// From WAVE_FORMAT_MSAUDIO1 (Microsoft Corporation)
	MS_Audio_1 = 0x0160,
	// From WAVE_FORMAT_WMAUDIO2 (Microsoft Corporation)
	WM_Audio_2 = 0x0161,
	// From WAVE_FORMAT_WMAUDIO3 (Microsoft Corporation)
	WM_Audio_3 = 0x0162,
	// From WAVE_FORMAT_WMAUDIO_LOSSLESS (Microsoft Corporation)
	WM_Audio_Lossless = 0x0163,
	// From WAVE_FORMAT_WMASPDIF (Microsoft Corporation)
	WM_ASPDIF = 0x0164,
	// From WAVE_FORMAT_UNISYS_NAP_ADPCM (Unisys Corp.)
	Unisys_NAP_ADPCM = 0x0170,
	// From WAVE_FORMAT_UNISYS_NAP_ULAW (Unisys Corp.)
	Unisys_NAP_ULAW = 0x0171,
	// From WAVE_FORMAT_UNISYS_NAP_ALAW (Unisys Corp.)
	Unisys_NAP_ALAW = 0x0172,
	// From WAVE_FORMAT_UNISYS_NAP_16K (Unisys Corp.)
	Unisys_NAP_16K = 0x0173,
	// From WAVE_FORMAT_SYCOM_ACM_SYC008 (SyCom Technologies)
	SyCom_ACM_SYC008 = 0x0174,
	// From WAVE_FORMAT_SYCOM_ACM_SYC701_G726L (SyCom Technologies)
	SyCom_ACM_SYC701_G726L = 0x0175,
	// From WAVE_FORMAT_SYCOM_ACM_SYC701_CELP54 (SyCom Technologies)
	SyCom_ACM_SYC701_CELP54 = 0x0176,
	// From WAVE_FORMAT_SYCOM_ACM_SYC701_CELP68 (SyCom Technologies)
	SyCom_ACM_SYC701_CELP68 = 0x0177,
	// From WAVE_FORMAT_KNOWLEDGE_ADVENTURE_ADPCM (Knowledge Adventure, Inc.)
	Knowledge_Adventure_ADPCM = 0x0178,
	// From WAVE_FORMAT_FRAUNHOFER_IIS_MPEG2_AAC (Fraunhofer IIS)
	Fraunhofer_IIS_MPEG2_AAC = 0x0180,
	// From WAVE_FORMAT_DTS_DS (Digital Theatre Systems, Inc.)
	DTS_DS = 0x0190,
	// From WAVE_FORMAT_CREATIVE_ADPCM (Creative Labs, Inc)
	Creative_ADPCM = 0x0200,
	// From WAVE_FORMAT_CREATIVE_FASTSPEECH8 (Creative Labs, Inc)
	Creative_Fast_Speech_8 = 0x0202,
	// From WAVE_FORMAT_CREATIVE_FASTSPEECH10 (Creative Labs, Inc)
	Creative_Fast_Speech_10 = 0x0203,
	// From WAVE_FORMAT_UHER_ADPCM (UHER informatic GmbH)
	UHER_ADPCM = 0x0210,
	// From WAVE_FORMAT_ULEAD_DV_AUDIO (Ulead Systems, Inc.)
	Ulead_DV_Audio = 0x0215,
	// From WAVE_FORMAT_ULEAD_DV_AUDIO_1 (Ulead Systems, Inc.)
	Ulead_DV_Audio_1 = 0x0216,
	// From WAVE_FORMAT_QUARTERDECK (Quarterdeck Corporation)
	Quarterdeck = 0x0220,
	// From WAVE_FORMAT_ILINK_VC (I-link Worldwide)
	ILink_VC = 0x0230,
	// From WAVE_FORMAT_RAW_SPORT (Aureal Semiconductor)
	Raw_Sport = 0x0240,
	// From WAVE_FORMAT_ESST_AC3 (ESS Technology, Inc.)
	ESST_AC3 = 0x0241,
	// From WAVE_FORMAT_GENERIC_PASSTHRU
	Generic_Passthru = 0x0249,
	// From WAVE_FORMAT_IPI_HSX (Interactive Products, Inc.)
	IPI_HSX = 0x0250,
	// From WAVE_FORMAT_IPI_RPELP (Interactive Products, Inc.)
	IPI_RPELP = 0x0251,
	// From WAVE_FORMAT_CS2 (Consistent Software)
	CS2 = 0x0260,
	// From WAVE_FORMAT_SONY_SCX (Sony Corp.)
	Sony_SCX = 0x0270,
	// From WAVE_FORMAT_SONY_SCY (Sony Corp.)
	Sony_SCY = 0x0271,
	// From WAVE_FORMAT_SONY_ATRAC3 (Sony Corp.)
	Sony_ATRAC3 = 0x0272,
	// From WAVE_FORMAT_SONY_SPC (Sony Corp.)
	Sony_SPC = 0x0273,
	// From WAVE_FORMAT_TELUM_AUDIO (Telum Inc.)
	Telum_Audio = 0x0280,
	// From WAVE_FORMAT_TELUM_IA_AUDIO (Telum Inc.)
	Telum_IA_Audio = 0x0281,
	// From WAVE_FORMAT_NORCOM_VOICE_SYSTEMS_ADPCM (Norcom Electronics Corp.)
	Norcom_Voice_Systems_ADPCM = 0x0285,
	// From WAVE_FORMAT_FM_TOWNS_SND (Fujitsu Corp.)
	FM_Towns_SND = 0x0300,
	// From WAVE_FORMAT_MICRONAS (Micronas Semiconductors, Inc.)
	Micronas = 0x0350,
	// From WAVE_FORMAT_MICRONAS_CELP833 (Micronas Semiconductors, Inc.)
	Micronas_CELP833 = 0x0351,
	// From WAVE_FORMAT_BTV_DIGITAL (Brooktree Corporation)
	BTV_Digital = 0x0400,
	// From WAVE_FORMAT_INTEL_MUSIC_CODER (Intel Corp.)
	Intel_Music_Coder = 0x0401,
	// From WAVE_FORMAT_INDEO_AUDIO (Ligos)
	Indeo_Audio = 0x0402,
	// From WAVE_FORMAT_QDESIGN_MUSIC (QDesign Corporation)
	QDesign_Music = 0x0450,
	// From WAVE_FORMAT_ON2_VP7_AUDIO (On2 Technologies)
	On2_VP7_Audio = 0x0500,
	// From WAVE_FORMAT_ON2_VP6_AUDIO (On2 Technologies)
	On2_VP6_Audio = 0x0501,
	// From WAVE_FORMAT_VME_VMPCM (AT&T Labs, Inc.)
	VME_VMPCM = 0x0680,
	// From WAVE_FORMAT_TPC (AT&T Labs, Inc.)
	TPC = 0x0681,
	// From WAVE_FORMAT_LIGHTWAVE_LOSSLESS (Clearjump)
	Lightwave_Lossless = 0x08AE,
	// From WAVE_FORMAT_OLIGSM (Ing C. Olivetti & C., S.p.A.)
	OLIGSM = 0x1000,
	// From WAVE_FORMAT_OLIADPCM (Ing C. Olivetti & C., S.p.A.)
	OLIADPCM = 0x1001,
	// From WAVE_FORMAT_OLICELP (Ing C. Olivetti & C., S.p.A.)
	OLICELP = 0x1002,
	// From WAVE_FORMAT_OLISBC (Ing C. Olivetti & C., S.p.A.)
	OLISBC = 0x1003,
	// From WAVE_FORMAT_OLIOPR (Ing C. Olivetti & C., S.p.A.)
	OLIOPR = 0x1004,
	// From WAVE_FORMAT_LH_CODEC (Lernout & Hauspie)
	LH_Codec = 0x1100,
	// From WAVE_FORMAT_LH_CODEC_CELP (Lernout & Hauspie)
	LH_Codec_CELP = 0x1101,
	// From WAVE_FORMAT_LH_CODEC_SBC8 (Lernout & Hauspie)
	LH_Codec_SBC8 = 0x1102,
	// From WAVE_FORMAT_LH_CODEC_SBC12 (Lernout & Hauspie)
	LH_Codec_SBC12 = 0x1103,
	// From WAVE_FORMAT_LH_CODEC_SBC16 (Lernout & Hauspie)
	LH_Codec_SBC16 = 0x1104,
	// From WAVE_FORMAT_NORRIS (Norris Communications, Inc.)
	Norris = 0x1400,
	// From WAVE_FORMAT_ISIAUDIO_2 (ISIAudio)
	ISI_Audio_2 = 0x1401,
	// From WAVE_FORMAT_SOUNDSPACE_MUSICOMPRESS (AT&T Labs, Inc.)
	Soundspace_Musicompress = 0x1500,
	// From WAVE_FORMAT_MPEG_ADTS_AAC (Microsoft Corporation)
	Mpeg_ADTS_AAC = 0x1600,
	// From WAVE_FORMAT_MPEG_RAW_AAC (Microsoft Corporation)
	Mpeg_Raw_AAC = 0x1601,
	// From WAVE_FORMAT_MPEG_LOAS (Microsoft Corporation (MPEG-4 Audio Transport Streams (LOAS/LATM))
	Mpeg_LOAS = 0x1602,
	// From WAVE_FORMAT_NOKIA_MPEG_ADTS_AAC (Microsoft Corporation)
	Nokia_MPEG_ADTS_AAC = 0x1608,
	// From WAVE_FORMAT_NOKIA_MPEG_RAW_AAC (Microsoft Corporation)
	Nokia_MPEG_Raw_AAC = 0x1609,
	// From WAVE_FORMAT_VODAFONE_MPEG_ADTS_AAC (Microsoft Corporation)
	Vodafone_MPEG_ADTS_AAC = 0x160A,
	// From WAVE_FORMAT_VODAFONE_MPEG_RAW_AAC (Microsoft Corporation)
	Vodafone_MPEG_Raw_AAC = 0x160B,
	// From WAVE_FORMAT_MPEG_HEAAC (Microsoft Corporation (MPEG-2 AAC or MPEG-4 HE-AAC v1/v2 streams with any payload (ADTS, ADIF, LOAS/LATM, RAW). Format block includes MP4 AudioSpecificConfig() -- see HEAACWAVEFORMAT below)
	MPEG_HEAAC = 0x1610,
	// From WAVE_FORMAT_VOXWARE_RT24_SPEECH (Voxware Inc.)
	Voxware_RT24_Speech = 0x181C,
	// From WAVE_FORMAT_SONICFOUNDRY_LOSSLESS (Sonic Foundry)
	Sonic_Foundry_Lossless = 0x1971,
	// From WAVE_FORMAT_INNINGS_TELECOM_ADPCM (Innings Telecom Inc.)
	Innings_Telecom_ADPCM = 0x1979,
	// From WAVE_FORMAT_LUCENT_SX8300P (Lucent Technologies)
	Lucent_SX8300P = 0x1C07,
	// From WAVE_FORMAT_LUCENT_SX5363S (Lucent Technologies)
	Lucent_SX5363S = 0x1C0C,
	// From WAVE_FORMAT_CUSEEME (CUSeeMe)
	CUSeeMe = 0x1F03,
	// From WAVE_FORMAT_NTCSOFT_ALF2CM_ACM (NTCSoft)
	NTCSoft_ALF2CM_ACM = 0x1FC4,
	// From WAVE_FORMAT_DVM (FAST Multimedia AG)
	DVM = 0x2000,
	// From WAVE_FORMAT_DTS2
	DTS2 = 0x2001, 
	// From WAVE_FORMAT_MAKEAVIS
	Make_AVIS = 0x3313, 
	// From WAVE_FORMAT_DIVIO_MPEG4_AAC (Divio, Inc.)
	Divio_MPEG4_AAC = 0x4143,
	// From WAVE_FORMAT_NOKIA_ADAPTIVE_MULTIRATE (Nokia)
	Nokia_Adaptive_Multirate = 0x4201,
	// From WAVE_FORMAT_DIVIO_G726 (Divio, Inc.)
	Divio_G726 = 0x4243,
	// From WAVE_FORMAT_LEAD_SPEECH (LEAD Technologies)
	Lead_Speech = 0x434C,
	// From WAVE_FORMAT_LEAD_VORBIS (LEAD Technologies)
	Lead_Vorbis = 0x564C,
	// From WAVE_FORMAT_WAVPACK_AUDIO (xiph.org)
	Wav_Pack_Audio = 0x5756,
	// From WAVE_FORMAT_ALAC (Apple Lossless)
	ALAC = 0x6C61,
	// From WAVE_FORMAT_OGG_VORBIS_MODE_1 (Ogg Vorbis)
	OGG_Vorbis_Mode_1 = 0x674F,
	// From WAVE_FORMAT_OGG_VORBIS_MODE_2 (Ogg Vorbis)
	OGG_Vorbis_Mode_2 = 0x6750,
	// From WAVE_FORMAT_OGG_VORBIS_MODE_3 (Ogg Vorbis)
	OGG_Vorbis_Mode_3 = 0x6751,
	// From WAVE_FORMAT_OGG_VORBIS_MODE_1_PLUS (Ogg Vorbis)
	OGG_Vorbis_Mode_1_Plus = 0x676F,
	// From WAVE_FORMAT_OGG_VORBIS_MODE_2_PLUS (Ogg Vorbis)
	OGG_Vorbis_Mode_2_Plus = 0x6770,
	// From WAVE_FORMAT_OGG_VORBIS_MODE_3_PLUS (Ogg Vorbis)
	OGG_Vorbis_Mode_3_Plus = 0x6771,
	// From WAVE_FORMAT_3COM_NBX (3COM Corp.)
	Format_3COM_NBX = 0x7000,
	// From WAVE_FORMAT_OPUS (Opus)
	Opus = 0x704F,
	// From WAVE_FORMAT_FAAD_AAC
	Faad_aac = 0x706D,
	// From WAVE_FORMAT_AMR_NB (AMR Narrowband)
	Amr_nb = 0x7361,
	// From WAVE_FORMAT_AMR_WB (AMR Wideband)
	Amr_wb = 0x7362,
	// From WAVE_FORMAT_AMR_WP (AMR Wideband Plus)
	Amr_wp = 0x7363,
	// From WAVE_FORMAT_GSM_AMR_CBR (GSMA/3GPP)
	Gsm_amr_cbr = 0x7A21,
	// From WAVE_FORMAT_GSM_AMR_VBR_SID (GSMA/3GPP)
	Gsm_amr_vbr_sid = 0x7A22,
	// From WAVE_FORMAT_COMVERSE_INFOSYS_G723_1 (Comverse Infosys)
	Comverse_infosys_g723_1 = 0xA100,
	// From WAVE_FORMAT_COMVERSE_INFOSYS_AVQSBC (Comverse Infosys)
	Comverse_infosys_avqsbc = 0xA101,
	// From WAVE_FORMAT_COMVERSE_INFOSYS_SBC (Comverse Infosys)
	Comverse_infosys_sbc = 0xA102,
	// From WAVE_FORMAT_SYMBOL_G729_A (Symbol Technologies)
	Symbol_g729_a = 0xA103,
	// From WAVE_FORMAT_VOICEAGE_AMR_WB (VoiceAge Corp.)
	Voice_Age_AMR_WB = 0xA104,
	// From WAVE_FORMAT_INGENIENT_G726 (Ingenient Technologies, Inc.)
	Ingenient_G726 = 0xA105,
	// From WAVE_FORMAT_MPEG4_AAC (ISO/MPEG-4)
	MPEG4_AAC = 0xA106,
	// From WAVE_FORMAT_ENCORE_G726 (Encore Software)
	Encore_G726 = 0xA107,
	// From WAVE_FORMAT_ZOLL_ASAO (ZOLL Medical Corp.)
	Zoll_ASAO = 0xA108,
	// From WAVE_FORMAT_SPEEX_VOICE (xiph.org)
	Speex_Voice = 0xA109,
	// From WAVE_FORMAT_VIANIX_MASC (Vianix LLC)
	Vianix_MASC = 0xA10A,
	// From WAVE_FORMAT_WM9_SPECTRUM_ANALYZER (Microsoft)
	WM9_Spectrum_Analyzer = 0xA10B,
	// From WAVE_FORMAT_WMF_SPECTRUM_ANAYZER (Microsoft)
	WMF_Spectrum_Anayzer = 0xA10C,
	// From WAVE_FORMAT_GSM_610
	GSM_610 = 0xA10D,
	// From WAVE_FORMAT_GSM_620
	GSM_620 = 0xA10E, 
	// From WAVE_FORMAT_GSM_660
	GSM_660 = 0xA10F, 
	// From WAVE_FORMAT_GSM_690
	GSM_690 = 0xA110, 
	// From WAVE_FORMAT_GSM_ADAPTIVE_MULTIRATE_WB
	GSM_Adaptive_Multirate_wb = 0xA111, 
	// From WAVE_FORMAT_POLYCOM_G722 (Polycom)
	Polycom_G722 = 0xA112,
	// From WAVE_FORMAT_POLYCOM_G728 (Polycom)
	Polycom_G728 = 0xA113,
	// From WAVE_FORMAT_POLYCOM_G729_A (Polycom)
	Polycom_G729_A = 0xA114,
	// From WAVE_FORMAT_POLYCOM_SIREN (Polycom)
	Polycom_Siren = 0xA115,
	// From WAVE_FORMAT_GLOBAL_IP_ILBC (Global IP)
	Global_IP_ILBC = 0xA116,
	// From WAVE_FORMAT_RADIOTIME_TIME_SHIFT_RADIO (RadioTime)
	Radiotime_Time_Shift_Radio = 0xA117,
	// From WAVE_FORMAT_NICE_ACA (Nice Systems)
	Nice_ACA = 0xA118,
	// From WAVE_FORMAT_NICE_ADPCM (Nice Systems)
	Nice_ADPCM = 0xA119,
	// From WAVE_FORMAT_VOCORD_G721 (Vocord Telecom)
	Vocord_G721 = 0xA11A,
	// From WAVE_FORMAT_VOCORD_G726 (Vocord Telecom)
	Vocord_G726 = 0xA11B,
	// From WAVE_FORMAT_VOCORD_G722_1 (Vocord Telecom)
	Vocord_G722_1 = 0xA11C,
	// From WAVE_FORMAT_VOCORD_G728 (Vocord Telecom)
	Vocord_G728 = 0xA11D,
	// From WAVE_FORMAT_VOCORD_G729 (Vocord Telecom)
	Vocord_G729 = 0xA11E,
	// From WAVE_FORMAT_VOCORD_G729_A (Vocord Telecom)
	Vocord_G729_A = 0xA11F,
	// From WAVE_FORMAT_VOCORD_G723_1 (Vocord Telecom)
	Vocord_G723_1 = 0xA120,
	// From WAVE_FORMAT_VOCORD_LBC (Vocord Telecom)
	Vocord_LBC = 0xA121,
	// From WAVE_FORMAT_NICE_G728 (Nice Systems)
	Nice_G728 = 0xA122,
	// From WAVE_FORMAT_FRACE_TELECOM_G729 (France Telecom)
	Frace_Telecom_G729 = 0xA123,
	// From WAVE_FORMAT_CODIAN (CODIAN)
	CODIAN = 0xA124,
	// From WAVE_FORMAT_DOLBY_AC4 (Dolby AC-4)
	Dolby_AC4 = 0xAC40,
	// From WAVE_FORMAT_FLAC (flac.sourceforge.net)
	FLAC = 0xF1AC,
	// From WAVE_FORMAT_EXTENSIBLE (Microsoft)
	Extensible = 0xFFFE,
	// From WAVE_FORMAT_DEVELOPMENT
	Development = 0xFFFF,
}
