
var from = "";
$(document).ready(function () {
    // Initialize form variable
    from = $("#formDenShort").val();

    // Initial calculation
    f_Capitol_1128();

    // Attach event listener to all input fields initially present
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f_Capitol_1128();
    });

    // Use event delegation to handle dynamically added rows
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", function (e) {
        f_Capitol_1128();
    });
});

//Change this function to be for column 10.
function f_Capitol_1128() {
    var R500_C8 = $("#64_1128_59030_500_8");

    var R510_C8 = $("#64_1128_59032_510_8");
    var R511_C8 = $("#64_1128_59033_511_8");
    var R512_C8 = $("#64_1128_59034_512_8");
    var R513_C8 = $("#64_1128_59035_513_8");
    var R514_C8 = $("#64_1128_59036_514_8");
    var R515_C8 = $("#64_1128_59037_515_8");
    var R516_C8 = $("#64_1128_59038_516_8");
    var R517_C8 = $("#64_1128_59039_517_8");
    var R518_C8 = $("#64_1128_59040_518_8");
    var R519_C8 = $("#64_1128_59041_519_8");
    var R520_C8 = $("#64_1128_59042_520_8");
    var R521_C8 = $("#64_1128_59043_521_8");
    var R522_C8 = $("#64_1128_59044_522_8");
    var R523_C8 = $("#64_1128_59045_523_8");
    var R524_C8 = $("#64_1128_59046_524_8");
    var R525_C8 = $("#64_1128_59047_525_8");
    var R526_C8 = $("#64_1128_59048_526_8");
    var R527_C8 = $("#64_1128_59049_527_8");
    var R528_C8 = $("#64_1128_59050_528_8");
    var R529_C8 = $("#64_1128_59051_529_8");
    var R530_C8 = $("#64_1128_59052_530_8");
    var R531_C8 = $("#64_1128_59053_531_8");
    var R532_C8 = $("#64_1128_59054_532_8");
    var R533_C8 = $("#64_1128_59055_533_8");
    var R534_C8 = $("#64_1128_59056_534_8");
    var R535_C8 = $("#64_1128_59057_535_8");
    var R536_C8 = $("#64_1128_59058_536_8");
    var R537_C8 = $("#64_1128_59059_537_8");
    var R538_C8 = $("#64_1128_59060_538_8");
    var R539_C8 = $("#64_1128_59061_539_8");
    var R540_C8 = $("#64_1128_59062_540_8");
    var R541_C8 = $("#64_1128_59063_541_8");
    var R542_C8 = $("#64_1128_59064_542_8");
    var R543_C8 = $("#64_1128_59065_543_8");
    var R544_C8 = $("#64_1128_59066_544_8");
    var R545_C8 = $("#64_1128_59067_545_8");
    var R546_C8 = $("#64_1128_59068_546_8");
    var R547_C8 = $("#64_1128_59069_547_8");
    var R548_C8 = $("#64_1128_59070_548_8");
    var R549_C8 = $("#64_1128_59071_549_8");
    var R550_C8 = $("#64_1128_59072_550_8");
    var R551_C8 = $("#64_1128_59073_551_8");
    var R552_C8 = $("#64_1128_59074_552_8");
    var R553_C8 = $("#64_1128_59075_553_8");
    var R554_C8 = $("#64_1128_59076_554_8");
    var R555_C8 = $("#64_1128_59077_555_8");
    var R556_C8 = $("#64_1128_59078_556_8");
    var R557_C8 = $("#64_1128_59079_557_8");
    var R558_C8 = $("#64_1128_59080_558_8");
    var R559_C8 = $("#64_1128_59081_559_8");
    var R560_C8 = $("#64_1128_59082_560_8");
    var R561_C8 = $("#64_1128_59083_561_8");
    var R562_C8 = $("#64_1128_59084_562_8");
    var R563_C8 = $("#64_1128_59085_563_8");
    var R564_C8 = $("#64_1128_59086_564_8");
    var R565_C8 = $("#64_1128_59087_565_8");
    var R566_C8 = $("#64_1128_59088_566_8");
    var R567_C8 = $("#64_1128_59089_567_8");
    var R568_C8 = $("#64_1128_59090_568_8");
    var R569_C8 = $("#64_1128_59091_569_8");
    var R570_C8 = $("#64_1128_59092_570_8");
    var R571_C8 = $("#64_1128_59093_571_8");
    var R572_C8 = $("#64_1128_59094_572_8");
    var R573_C8 = $("#64_1128_59095_573_8");
    var R574_C8 = $("#64_1128_59096_574_8");
    var R575_C8 = $("#64_1128_59097_575_8");
    var R576_C8 = $("#64_1128_59098_576_8");
    var R577_C8 = $("#64_1128_59099_577_8");
    var R578_C8 = $("#64_1128_59100_578_8");
    var R579_C8 = $("#64_1128_59101_579_8");
    var R580_C8 = $("#64_1128_59102_580_8");
    var R581_C8 = $("#64_1128_59103_581_8");
    var R582_C8 = $("#64_1128_59104_582_8");
    var R583_C8 = $("#64_1128_59105_583_8");
    var R584_C8 = $("#64_1128_59106_584_8");
    var R585_C8 = $("#64_1128_59107_585_8");
    var R586_C8 = $("#64_1128_59108_586_8");
    var R587_C8 = $("#64_1128_59109_587_8");
    var R588_C8 = $("#64_1128_59110_588_8");
    var R589_C8 = $("#64_1128_59111_589_8");
    var R590_C8 = $("#64_1128_59112_590_8");
    var R591_C8 = $("#64_1128_59113_591_8");
    var R592_C8 = $("#64_1128_59114_592_8");
    var R593_C8 = $("#64_1128_59115_593_8");
    var R594_C8 = $("#64_1128_59116_594_8");
    var R595_C8 = $("#64_1128_59117_595_8");
    var R596_C8 = $("#64_1128_59118_596_8");
    var R597_C8 = $("#64_1128_59119_597_8");
    var R598_C8 = $("#64_1128_59120_598_8");
    var R599_C8 = $("#64_1128_59121_599_8");
    var R600_C8 = $("#64_1128_59122_600_8");
    var R601_C8 = $("#64_1128_59123_601_8");
    var R602_C8 = $("#64_1128_59124_602_8");
    var R603_C8 = $("#64_1128_59125_603_8");
    var R604_C8 = $("#64_1128_59126_604_8");
    var R605_C8 = $("#64_1128_59127_605_8");
    var R606_C8 = $("#64_1128_59128_606_8");
    var R607_C8 = $("#64_1128_59129_607_8");
    var R608_C8 = $("#64_1128_59130_608_8");
    var R609_C8 = $("#64_1128_59131_609_8");
    var R610_C8 = $("#64_1128_59132_610_8");
    var R611_C8 = $("#64_1128_59133_611_8");
    var R612_C8 = $("#64_1128_59134_612_8");
    var R613_C8 = $("#64_1128_59135_613_8");
    var R614_C8 = $("#64_1128_59136_614_8");
    var R615_C8 = $("#64_1128_59137_615_8");
    var R616_C8 = $("#64_1128_59138_616_8");
    var R617_C8 = $("#64_1128_59139_617_8");
    var R618_C8 = $("#64_1128_59140_618_8");
    var R619_C8 = $("#64_1128_59141_619_8");
    var R620_C8 = $("#64_1128_59142_620_8");
    var R621_C8 = $("#64_1128_59143_621_8");
    var R622_C8 = $("#64_1128_59144_622_8");
    var R623_C8 = $("#64_1128_59145_623_8");
    var R624_C8 = $("#64_1128_59146_624_8");
    var R625_C8 = $("#64_1128_59147_625_8");
    var R626_C8 = $("#64_1128_59148_626_8");
    var R627_C8 = $("#64_1128_59149_627_8");
    var R628_C8 = $("#64_1128_59150_628_8");
    var R629_C8 = $("#64_1128_59151_629_8");
    var R630_C8 = $("#64_1128_59152_630_8");
    var R631_C8 = $("#64_1128_59153_631_8");
    var R632_C8 = $("#64_1128_59154_632_8");
    var R633_C8 = $("#64_1128_59155_633_8");
    var R634_C8 = $("#64_1128_59156_634_8");
    var R635_C8 = $("#64_1128_59157_635_8");
    var R636_C8 = $("#64_1128_59158_636_8");
    var R637_C8 = $("#64_1128_59159_637_8");
    var R638_C8 = $("#64_1128_59160_638_8");
    var R639_C8 = $("#64_1128_59161_639_8");
    var R640_C8 = $("#64_1128_59162_640_8");
    var R641_C8 = $("#64_1128_59163_641_8");
    var R642_C8 = $("#64_1128_59164_642_8");
    var R643_C8 = $("#64_1128_59165_643_8");
    var R644_C8 = $("#64_1128_59166_644_8");
    var R645_C8 = $("#64_1128_59167_645_8");
    var R646_C8 = $("#64_1128_59168_646_8");
    var R647_C8 = $("#64_1128_59169_647_8");
    var R648_C8 = $("#64_1128_59170_648_8");
    var R649_C8 = $("#64_1128_59171_649_8");
    var R650_C8 = $("#64_1128_59172_650_8");
    var R651_C8 = $("#64_1128_59173_651_8");
    var R652_C8 = $("#64_1128_59174_652_8");
    var R653_C8 = $("#64_1128_59175_653_8");
    var R654_C8 = $("#64_1128_59176_654_8");
    var R655_C8 = $("#64_1128_59177_655_8");
    var R656_C8 = $("#64_1128_59178_656_8");
    var R657_C8 = $("#64_1128_59179_657_8");
    var R658_C8 = $("#64_1128_59180_658_8");
    var R659_C8 = $("#64_1128_59181_659_8");
    var R660_C8 = $("#64_1128_59182_660_8");
    var R661_C8 = $("#64_1128_59183_661_8");
    var R662_C8 = $("#64_1128_59184_662_8");
    var R663_C8 = $("#64_1128_59185_663_8");
    var R664_C8 = $("#64_1128_59186_664_8");
    var R665_C8 = $("#64_1128_59187_665_8");
    var R666_C8 = $("#64_1128_59188_666_8");
    var R667_C8 = $("#64_1128_59189_667_8");
    var R668_C8 = $("#64_1128_59190_668_8");
    var R669_C8 = $("#64_1128_59191_669_8");
    var R670_C8 = $("#64_1128_59192_670_8");
    var R671_C8 = $("#64_1128_59193_671_8");
    var R672_C8 = $("#64_1128_59194_672_8");
    var R673_C8 = $("#64_1128_59195_673_8");
    var R674_C8 = $("#64_1128_59196_674_8");
    var R675_C8 = $("#64_1128_59197_675_8");
    var R676_C8 = $("#64_1128_59198_676_8");
    var R677_C8 = $("#64_1128_59199_677_8");
    var R678_C8 = $("#64_1128_59200_678_8");
    var R679_C8 = $("#64_1128_59201_679_8");
    var R680_C8 = $("#64_1128_59202_680_8");
    var R681_C8 = $("#64_1128_59203_681_8");
    var R682_C8 = $("#64_1128_59204_682_8");
    var R683_C8 = $("#64_1128_59205_683_8");
    var R684_C8 = $("#64_1128_59206_684_8");
    var R685_C8 = $("#64_1128_59207_685_8");
    var R686_C8 = $("#64_1128_59208_686_8");
    var R687_C8 = $("#64_1128_59209_687_8");
    var R688_C8 = $("#64_1128_59210_688_8");
    var R689_C8 = $("#64_1128_59211_689_8");
    var R690_C8 = $("#64_1128_59212_690_8");
    var R691_C8 = $("#64_1128_59213_691_8");
    var R692_C8 = $("#64_1128_59214_692_8");
    var R693_C8 = $("#64_1128_59215_693_8");
    var R694_C8 = $("#64_1128_59216_694_8");
    var R695_C8 = $("#64_1128_59217_695_8");
    var R696_C8 = $("#64_1128_59218_696_8");
    var R697_C8 = $("#64_1128_59219_697_8");
    var R698_C8 = $("#64_1128_59220_698_8");
    var R699_C8 = $("#64_1128_59221_699_8");
    var R700_C8 = $("#64_1128_59222_700_8");
    var R701_C8 = $("#64_1128_59223_701_8");
    var R702_C8 = $("#64_1128_59224_702_8");
    var R703_C8 = $("#64_1128_59225_703_8");
    var R704_C8 = $("#64_1128_59226_704_8");
    var R705_C8 = $("#64_1128_59227_705_8");
    var R706_C8 = $("#64_1128_59228_706_8");
    var R707_C8 = $("#64_1128_59229_707_8");
    var R708_C8 = $("#64_1128_59230_708_8");
    var R709_C8 = $("#64_1128_59231_709_8");
    var R710_C8 = $("#64_1128_59232_710_8");
    var R711_C8 = $("#64_1128_59233_711_8");
    var R712_C8 = $("#64_1128_59234_712_8");
    var R713_C8 = $("#64_1128_59235_713_8");
    var R714_C8 = $("#64_1128_59236_714_8");
    var R715_C8 = $("#64_1128_59237_715_8");
    var R716_C8 = $("#64_1128_59238_716_8");
    var R717_C8 = $("#64_1128_59239_717_8");
    var R718_C8 = $("#64_1128_59240_718_8");
    var R719_C8 = $("#64_1128_59241_719_8");
    var R720_C8 = $("#64_1128_59242_720_8");
    var R721_C8 = $("#64_1128_59243_721_8");
    var R722_C8 = $("#64_1128_59244_722_8");
    var R723_C8 = $("#64_1128_59245_723_8");
    var R724_C8 = $("#64_1128_59246_724_8");
    var R725_C8 = $("#64_1128_59247_725_8");
    var R726_C8 = $("#64_1128_59248_726_8");
    var R727_C8 = $("#64_1128_59249_727_8");
    var R728_C8 = $("#64_1128_59250_728_8");
    var R729_C8 = $("#64_1128_59251_729_8");
    var R730_C8 = $("#64_1128_59252_730_8");
    var R731_C8 = $("#64_1128_59253_731_8");
    var R732_C8 = $("#64_1128_59254_732_8");
    var R733_C8 = $("#64_1128_59255_733_8");
    var R734_C8 = $("#64_1128_59256_734_8");
    var R735_C8 = $("#64_1128_59257_735_8");
    var R736_C8 = $("#64_1128_59258_736_8");
    var R737_C8 = $("#64_1128_59259_737_8");
    var R738_C8 = $("#64_1128_59260_738_8");
    var R739_C8 = $("#64_1128_59261_739_8");
    var R740_C8 = $("#64_1128_59262_740_8");
    var R741_C8 = $("#64_1128_59263_741_8");
    var R742_C8 = $("#64_1128_59264_742_8");
    var R743_C8 = $("#64_1128_59265_743_8");
    var R744_C8 = $("#64_1128_59266_744_8");
    var R745_C8 = $("#64_1128_59267_745_8");
    var R746_C8 = $("#64_1128_59268_746_8");
    var R747_C8 = $("#64_1128_59269_747_8");
    var R748_C8 = $("#64_1128_59270_748_8");
    var R749_C8 = $("#64_1128_59271_749_8");
    var R750_C8 = $("#64_1128_59272_750_8");
    var R751_C8 = $("#64_1128_59273_751_8");
    var R752_C8 = $("#64_1128_59274_752_8");
    var R753_C8 = $("#64_1128_59275_753_8");
    var R754_C8 = $("#64_1128_59276_754_8");
    var R755_C8 = $("#64_1128_59277_755_8");
    var R756_C8 = $("#64_1128_59278_756_8");
    var R757_C8 = $("#64_1128_59279_757_8");
    var R758_C8 = $("#64_1128_59280_758_8");
    var R759_C8 = $("#64_1128_59281_759_8");
    var R760_C8 = $("#64_1128_59282_760_8");
    var R761_C8 = $("#64_1128_59283_761_8");
    var R762_C8 = $("#64_1128_59284_762_8");
    var R763_C8 = $("#64_1128_59285_763_8");
    var R764_C8 = $("#64_1128_59286_764_8");
    var R765_C8 = $("#64_1128_59287_765_8");
    var R766_C8 = $("#64_1128_59288_766_8");
    var R767_C8 = $("#64_1128_59289_767_8");
    var R768_C8 = $("#64_1128_59290_768_8");
    var R769_C8 = $("#64_1128_59291_769_8");
    var R770_C8 = $("#64_1128_59292_770_8");
    var R771_C8 = $("#64_1128_59293_771_8");
    var R772_C8 = $("#64_1128_59294_772_8");
    var R773_C8 = $("#64_1128_59295_773_8");
    var R774_C8 = $("#64_1128_59296_774_8");
    var R775_C8 = $("#64_1128_59297_775_8");
    var R776_C8 = $("#64_1128_59298_776_8");
    var R777_C8 = $("#64_1128_59299_777_8");
    var R778_C8 = $("#64_1128_59300_778_8");
    var R779_C8 = $("#64_1128_59301_779_8");
    var R780_C8 = $("#64_1128_59302_780_8");
    var R781_C8 = $("#64_1128_59303_781_8");
    var R782_C8 = $("#64_1128_59304_782_8");
    var R783_C8 = $("#64_1128_59305_783_8");
    var R784_C8 = $("#64_1128_59306_784_8");
    var R785_C8 = $("#64_1128_59307_785_8");
    var R786_C8 = $("#64_1128_59308_786_8");
    var R787_C8 = $("#64_1128_59309_787_8");
    var R788_C8 = $("#64_1128_59310_788_8");
    var R789_C8 = $("#64_1128_59311_789_8");
    var R790_C8 = $("#64_1128_59312_790_8");
    var R791_C8 = $("#64_1128_59313_791_8");
    var R792_C8 = $("#64_1128_59314_792_8");
    var R793_C8 = $("#64_1128_59315_793_8");
    var R794_C8 = $("#64_1128_59316_794_8");
    var R795_C8 = $("#64_1128_59317_795_8");
    var R796_C8 = $("#64_1128_59318_796_8");
    var R797_C8 = $("#64_1128_59319_797_8");
    var R798_C8 = $("#64_1128_59320_798_8");
    var R799_C8 = $("#64_1128_59321_799_8");
    var R800_C8 = $("#64_1128_59322_800_8");
    var R801_C8 = $("#64_1128_59323_801_8");
    var R802_C8 = $("#64_1128_59324_802_8");
    var R803_C8 = $("#64_1128_59325_803_8");
    var R804_C8 = $("#64_1128_59326_804_8");
    var R805_C8 = $("#64_1128_59327_805_8");
    var R806_C8 = $("#64_1128_59328_806_8");
    var R807_C8 = $("#64_1128_59329_807_8");
    var R808_C8 = $("#64_1128_61829_808_8");
    var R809_C8 = $("#64_1128_61830_809_8");
    var R810_C8 = $("#64_1128_61831_810_8");

    // Make specific fields read-only
    R500_C8.prop("readonly", true);

    // Calculate sum for R500_C8
    var values_R500_C8 = [
        parseFloat(R510_C8.val()) || 0.0,
        parseFloat(R511_C8.val()) || 0.0,
        parseFloat(R512_C8.val()) || 0.0,
        parseFloat(R513_C8.val()) || 0.0,
        parseFloat(R514_C8.val()) || 0.0,
        parseFloat(R515_C8.val()) || 0.0,
        parseFloat(R516_C8.val()) || 0.0,
        parseFloat(R517_C8.val()) || 0.0,
        parseFloat(R518_C8.val()) || 0.0,
        parseFloat(R519_C8.val()) || 0.0,
        parseFloat(R520_C8.val()) || 0.0,
        parseFloat(R521_C8.val()) || 0.0,
        parseFloat(R522_C8.val()) || 0.0,
        parseFloat(R523_C8.val()) || 0.0,
        parseFloat(R524_C8.val()) || 0.0,
        parseFloat(R525_C8.val()) || 0.0,
        parseFloat(R526_C8.val()) || 0.0,
        parseFloat(R527_C8.val()) || 0.0,
        parseFloat(R528_C8.val()) || 0.0,
        parseFloat(R529_C8.val()) || 0.0,
        parseFloat(R530_C8.val()) || 0.0,
        parseFloat(R531_C8.val()) || 0.0,
        parseFloat(R532_C8.val()) || 0.0,
        parseFloat(R533_C8.val()) || 0.0,
        parseFloat(R534_C8.val()) || 0.0,
        parseFloat(R535_C8.val()) || 0.0,
        parseFloat(R536_C8.val()) || 0.0,
        parseFloat(R537_C8.val()) || 0.0,
        parseFloat(R538_C8.val()) || 0.0,
        parseFloat(R539_C8.val()) || 0.0,
        parseFloat(R540_C8.val()) || 0.0,
        parseFloat(R541_C8.val()) || 0.0,
        parseFloat(R542_C8.val()) || 0.0,
        parseFloat(R543_C8.val()) || 0.0,
        parseFloat(R544_C8.val()) || 0.0,
        parseFloat(R545_C8.val()) || 0.0,
        parseFloat(R546_C8.val()) || 0.0,
        parseFloat(R547_C8.val()) || 0.0,
        parseFloat(R548_C8.val()) || 0.0,
        parseFloat(R549_C8.val()) || 0.0,
        parseFloat(R550_C8.val()) || 0.0,
        parseFloat(R551_C8.val()) || 0.0,
        parseFloat(R552_C8.val()) || 0.0,
        parseFloat(R553_C8.val()) || 0.0,
        parseFloat(R554_C8.val()) || 0.0,
        parseFloat(R555_C8.val()) || 0.0,
        parseFloat(R556_C8.val()) || 0.0,
        parseFloat(R557_C8.val()) || 0.0,
        parseFloat(R558_C8.val()) || 0.0,
        parseFloat(R559_C8.val()) || 0.0,
        parseFloat(R560_C8.val()) || 0.0,
        parseFloat(R561_C8.val()) || 0.0,
        parseFloat(R562_C8.val()) || 0.0,
        parseFloat(R563_C8.val()) || 0.0,
        parseFloat(R564_C8.val()) || 0.0,
        parseFloat(R565_C8.val()) || 0.0,
        parseFloat(R566_C8.val()) || 0.0,
        parseFloat(R567_C8.val()) || 0.0,
        parseFloat(R568_C8.val()) || 0.0,
        parseFloat(R569_C8.val()) || 0.0,
        parseFloat(R570_C8.val()) || 0.0,
        parseFloat(R571_C8.val()) || 0.0,
        parseFloat(R572_C8.val()) || 0.0,
        parseFloat(R573_C8.val()) || 0.0,
        parseFloat(R574_C8.val()) || 0.0,
        parseFloat(R575_C8.val()) || 0.0,
        parseFloat(R576_C8.val()) || 0.0,
        parseFloat(R577_C8.val()) || 0.0,
        parseFloat(R578_C8.val()) || 0.0,
        parseFloat(R579_C8.val()) || 0.0,
        parseFloat(R580_C8.val()) || 0.0,
        parseFloat(R581_C8.val()) || 0.0,
        parseFloat(R582_C8.val()) || 0.0,
        parseFloat(R583_C8.val()) || 0.0,
        parseFloat(R584_C8.val()) || 0.0,
        parseFloat(R585_C8.val()) || 0.0,
        parseFloat(R586_C8.val()) || 0.0,
        parseFloat(R587_C8.val()) || 0.0,
        parseFloat(R588_C8.val()) || 0.0,
        parseFloat(R589_C8.val()) || 0.0,
        parseFloat(R590_C8.val()) || 0.0,
        parseFloat(R591_C8.val()) || 0.0,
        parseFloat(R592_C8.val()) || 0.0,
        parseFloat(R593_C8.val()) || 0.0,
        parseFloat(R594_C8.val()) || 0.0,
        parseFloat(R595_C8.val()) || 0.0,
        parseFloat(R596_C8.val()) || 0.0,
        parseFloat(R597_C8.val()) || 0.0,
        parseFloat(R598_C8.val()) || 0.0,
        parseFloat(R599_C8.val()) || 0.0,
        parseFloat(R600_C8.val()) || 0.0,
        parseFloat(R601_C8.val()) || 0.0,
        parseFloat(R602_C8.val()) || 0.0,
        parseFloat(R603_C8.val()) || 0.0,
        parseFloat(R604_C8.val()) || 0.0,
        parseFloat(R605_C8.val()) || 0.0,
        parseFloat(R606_C8.val()) || 0.0,
        parseFloat(R607_C8.val()) || 0.0,
        parseFloat(R608_C8.val()) || 0.0,
        parseFloat(R609_C8.val()) || 0.0,
        parseFloat(R610_C8.val()) || 0.0,
        parseFloat(R611_C8.val()) || 0.0,
        parseFloat(R612_C8.val()) || 0.0,
        parseFloat(R613_C8.val()) || 0.0,
        parseFloat(R614_C8.val()) || 0.0,
        parseFloat(R615_C8.val()) || 0.0,
        parseFloat(R616_C8.val()) || 0.0,
        parseFloat(R617_C8.val()) || 0.0,
        parseFloat(R618_C8.val()) || 0.0,
        parseFloat(R619_C8.val()) || 0.0,
        parseFloat(R620_C8.val()) || 0.0,
        parseFloat(R621_C8.val()) || 0.0,
        parseFloat(R622_C8.val()) || 0.0,
        parseFloat(R623_C8.val()) || 0.0,
        parseFloat(R624_C8.val()) || 0.0,
        parseFloat(R625_C8.val()) || 0.0,
        parseFloat(R626_C8.val()) || 0.0,
        parseFloat(R627_C8.val()) || 0.0,
        parseFloat(R628_C8.val()) || 0.0,
        parseFloat(R629_C8.val()) || 0.0,
        parseFloat(R630_C8.val()) || 0.0,
        parseFloat(R631_C8.val()) || 0.0,
        parseFloat(R632_C8.val()) || 0.0,
        parseFloat(R633_C8.val()) || 0.0,
        parseFloat(R634_C8.val()) || 0.0,
        parseFloat(R635_C8.val()) || 0.0,
        parseFloat(R636_C8.val()) || 0.0,
        parseFloat(R637_C8.val()) || 0.0,
        parseFloat(R638_C8.val()) || 0.0,
        parseFloat(R639_C8.val()) || 0.0,
        parseFloat(R640_C8.val()) || 0.0,
        parseFloat(R641_C8.val()) || 0.0,
        parseFloat(R642_C8.val()) || 0.0,
        parseFloat(R643_C8.val()) || 0.0,
        parseFloat(R644_C8.val()) || 0.0,
        parseFloat(R645_C8.val()) || 0.0,
        parseFloat(R646_C8.val()) || 0.0,
        parseFloat(R647_C8.val()) || 0.0,
        parseFloat(R648_C8.val()) || 0.0,
        parseFloat(R649_C8.val()) || 0.0,
        parseFloat(R650_C8.val()) || 0.0,
        parseFloat(R651_C8.val()) || 0.0,
        parseFloat(R652_C8.val()) || 0.0,
        parseFloat(R653_C8.val()) || 0.0,
        parseFloat(R654_C8.val()) || 0.0,
        parseFloat(R655_C8.val()) || 0.0,
        parseFloat(R656_C8.val()) || 0.0,
        parseFloat(R657_C8.val()) || 0.0,
        parseFloat(R658_C8.val()) || 0.0,
        parseFloat(R659_C8.val()) || 0.0,
        parseFloat(R660_C8.val()) || 0.0,
        parseFloat(R661_C8.val()) || 0.0,
        parseFloat(R662_C8.val()) || 0.0,
        parseFloat(R663_C8.val()) || 0.0,
        parseFloat(R664_C8.val()) || 0.0,
        parseFloat(R665_C8.val()) || 0.0,
        parseFloat(R666_C8.val()) || 0.0,
        parseFloat(R667_C8.val()) || 0.0,
        parseFloat(R668_C8.val()) || 0.0,
        parseFloat(R669_C8.val()) || 0.0,
        parseFloat(R670_C8.val()) || 0.0,
        parseFloat(R671_C8.val()) || 0.0,
        parseFloat(R672_C8.val()) || 0.0,
        parseFloat(R673_C8.val()) || 0.0,
        parseFloat(R674_C8.val()) || 0.0,
        parseFloat(R675_C8.val()) || 0.0,
        parseFloat(R676_C8.val()) || 0.0,
        parseFloat(R677_C8.val()) || 0.0,
        parseFloat(R678_C8.val()) || 0.0,
        parseFloat(R679_C8.val()) || 0.0,
        parseFloat(R680_C8.val()) || 0.0,
        parseFloat(R681_C8.val()) || 0.0,
        parseFloat(R682_C8.val()) || 0.0,
        parseFloat(R683_C8.val()) || 0.0,
        parseFloat(R684_C8.val()) || 0.0,
        parseFloat(R685_C8.val()) || 0.0,
        parseFloat(R686_C8.val()) || 0.0,
        parseFloat(R687_C8.val()) || 0.0,
        parseFloat(R688_C8.val()) || 0.0,
        parseFloat(R689_C8.val()) || 0.0,
        parseFloat(R690_C8.val()) || 0.0,
        parseFloat(R691_C8.val()) || 0.0,
        parseFloat(R692_C8.val()) || 0.0,
        parseFloat(R693_C8.val()) || 0.0,
        parseFloat(R694_C8.val()) || 0.0,
        parseFloat(R695_C8.val()) || 0.0,
        parseFloat(R696_C8.val()) || 0.0,
        parseFloat(R697_C8.val()) || 0.0,
        parseFloat(R698_C8.val()) || 0.0,
        parseFloat(R699_C8.val()) || 0.0,
        parseFloat(R700_C8.val()) || 0.0,
        parseFloat(R701_C8.val()) || 0.0,
        parseFloat(R702_C8.val()) || 0.0,
        parseFloat(R703_C8.val()) || 0.0,
        parseFloat(R704_C8.val()) || 0.0,
        parseFloat(R705_C8.val()) || 0.0,
        parseFloat(R706_C8.val()) || 0.0,
        parseFloat(R707_C8.val()) || 0.0,
        parseFloat(R708_C8.val()) || 0.0,
        parseFloat(R709_C8.val()) || 0.0,
        parseFloat(R710_C8.val()) || 0.0,
        parseFloat(R711_C8.val()) || 0.0,
        parseFloat(R712_C8.val()) || 0.0,
        parseFloat(R713_C8.val()) || 0.0,
        parseFloat(R714_C8.val()) || 0.0,
        parseFloat(R715_C8.val()) || 0.0,
        parseFloat(R716_C8.val()) || 0.0,
        parseFloat(R717_C8.val()) || 0.0,
        parseFloat(R718_C8.val()) || 0.0,
        parseFloat(R719_C8.val()) || 0.0,
        parseFloat(R720_C8.val()) || 0.0,
        parseFloat(R721_C8.val()) || 0.0,
        parseFloat(R722_C8.val()) || 0.0,
        parseFloat(R723_C8.val()) || 0.0,
        parseFloat(R724_C8.val()) || 0.0,
        parseFloat(R725_C8.val()) || 0.0,
        parseFloat(R726_C8.val()) || 0.0,
        parseFloat(R727_C8.val()) || 0.0,
        parseFloat(R728_C8.val()) || 0.0,
        parseFloat(R729_C8.val()) || 0.0,
        parseFloat(R730_C8.val()) || 0.0,
        parseFloat(R731_C8.val()) || 0.0,
        parseFloat(R732_C8.val()) || 0.0,
        parseFloat(R733_C8.val()) || 0.0,
        parseFloat(R734_C8.val()) || 0.0,
        parseFloat(R735_C8.val()) || 0.0,
        parseFloat(R736_C8.val()) || 0.0,
        parseFloat(R737_C8.val()) || 0.0,
        parseFloat(R738_C8.val()) || 0.0,
        parseFloat(R739_C8.val()) || 0.0,
        parseFloat(R740_C8.val()) || 0.0,
        parseFloat(R741_C8.val()) || 0.0,
        parseFloat(R742_C8.val()) || 0.0,
        parseFloat(R743_C8.val()) || 0.0,
        parseFloat(R744_C8.val()) || 0.0,
        parseFloat(R745_C8.val()) || 0.0,
        parseFloat(R746_C8.val()) || 0.0,
        parseFloat(R747_C8.val()) || 0.0,
        parseFloat(R748_C8.val()) || 0.0,
        parseFloat(R749_C8.val()) || 0.0,
        parseFloat(R750_C8.val()) || 0.0,
        parseFloat(R751_C8.val()) || 0.0,
        parseFloat(R752_C8.val()) || 0.0,
        parseFloat(R753_C8.val()) || 0.0,
        parseFloat(R754_C8.val()) || 0.0,
        parseFloat(R755_C8.val()) || 0.0,
        parseFloat(R756_C8.val()) || 0.0,
        parseFloat(R757_C8.val()) || 0.0,
        parseFloat(R758_C8.val()) || 0.0,
        parseFloat(R759_C8.val()) || 0.0,
        parseFloat(R760_C8.val()) || 0.0,
        parseFloat(R761_C8.val()) || 0.0,
        parseFloat(R762_C8.val()) || 0.0,
        parseFloat(R763_C8.val()) || 0.0,
        parseFloat(R764_C8.val()) || 0.0,
        parseFloat(R765_C8.val()) || 0.0,
        parseFloat(R766_C8.val()) || 0.0,
        parseFloat(R767_C8.val()) || 0.0,
        parseFloat(R768_C8.val()) || 0.0,
        parseFloat(R769_C8.val()) || 0.0,
        parseFloat(R770_C8.val()) || 0.0,
        parseFloat(R771_C8.val()) || 0.0,
        parseFloat(R772_C8.val()) || 0.0,
        parseFloat(R773_C8.val()) || 0.0,
        parseFloat(R774_C8.val()) || 0.0,
        parseFloat(R775_C8.val()) || 0.0,
        parseFloat(R776_C8.val()) || 0.0,
        parseFloat(R777_C8.val()) || 0.0,
        parseFloat(R778_C8.val()) || 0.0,
        parseFloat(R779_C8.val()) || 0.0,
        parseFloat(R780_C8.val()) || 0.0,
        parseFloat(R781_C8.val()) || 0.0,
        parseFloat(R782_C8.val()) || 0.0,
        parseFloat(R783_C8.val()) || 0.0,
        parseFloat(R784_C8.val()) || 0.0,
        parseFloat(R785_C8.val()) || 0.0,
        parseFloat(R786_C8.val()) || 0.0,
        parseFloat(R787_C8.val()) || 0.0,
        parseFloat(R788_C8.val()) || 0.0,
        parseFloat(R789_C8.val()) || 0.0,
        parseFloat(R790_C8.val()) || 0.0,
        parseFloat(R791_C8.val()) || 0.0,
        parseFloat(R792_C8.val()) || 0.0,
        parseFloat(R793_C8.val()) || 0.0,
        parseFloat(R794_C8.val()) || 0.0,
        parseFloat(R795_C8.val()) || 0.0,
        parseFloat(R796_C8.val()) || 0.0,
        parseFloat(R797_C8.val()) || 0.0,
        parseFloat(R798_C8.val()) || 0.0,
        parseFloat(R799_C8.val()) || 0.0,
        parseFloat(R800_C8.val()) || 0.0,
        parseFloat(R801_C8.val()) || 0.0,
        parseFloat(R802_C8.val()) || 0.0,
        parseFloat(R803_C8.val()) || 0.0,
        parseFloat(R804_C8.val()) || 0.0,
        parseFloat(R805_C8.val()) || 0.0,
        parseFloat(R806_C8.val()) || 0.0,
        parseFloat(R807_C8.val()) || 0.0,
        parseFloat(R808_C8.val()) || 0.0,
        parseFloat(R809_C8.val()) || 0.0,
        parseFloat(R810_C8.val()) || 0.0
    ];

    var sum_R500_C8 = values_R500_C8.reduce((acc, curr) => acc + curr, 0);
    R500_C8.val(sum_R500_C8 === 0 ? "" : sum_R500_C8);
}






    
