// Ensure 'from' is a global variable
var from = "";

$(document).ready(function () {
    // Initialize form variable
    from = $("#formDenShort").val();

    // Initial calculation
    f_Capitol_1017();

    // Attach event listener to all input fields initially present
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f_Capitol_1017();
    });

    // Use event delegation to handle dynamically added rows
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", function (e) {
        f_Capitol_1017();
    });
});

function f_Capitol_1017() {
    // Define necessary variables based on the provided IDs
    var ids = [
        '11849_000', '11860_498', '11861_999', '12341_008', '12474_682', '12340_036', '78472_148',
        '12318_499', '12319_500', '12291_051', '12292_040', '12293_031', '12294_112', '12295_056',
        '12296_070', '12297_100', '12298_124', '12299_156', '12300_196', '12301_191', '12302_208',
        '12303_818', '12304_756', '12305_784', '12306_233', '12325_643', '12504_246', '12307_250',
        '12308_268', '12309_276', '12310_300', '12397_356', '12399_400', '12311_376', '12312_380',
        '12313_392', '12314_398', '12315_417', '12316_428', '12421_422', '12317_440', '12428_807',
        '12452_578', '12319_528', '12320_616', '12321_620', '12322_826', '12485_760', '12323_203',
        '12324_642', '12333_764', '12330_840', '12334_788', '12326_688', '12327_703', '12328_705',
        '12329_724', '12331_752', '12332_762', '12335_792', '12336_795', '12342_012', '12337_804',
        '12343_016', '12338_348', '12344_660', '12339_860', '12345_024', '12346_020', '12347_028',
        '12348_530', '12349_446', '12350_032', '12351_533', '12352_004', '12353_044', '12354_050',
        '12355_052', '12356_048', '12357_084', '12358_204', '12359_060', '12360_068', '12361_072',
        '12362_076', '12363_092', '12364_096', '12365_854', '12366_108', '12367_064', '12368_548',
        '12369_336', '12370_862', '12371_850', '12372_626', '12373_704', '12374_266', '12375_332',
        '12376_328', '12377_270', '12378_288', '12379_312', '12380_320', '12381_254', '12382_324',
        '12383_624', '12384_292', '12385_340', '12386_308', '12387_304', '12388_316', '12389_262',
        '12390_212', '12391_214', '12392_180', '12393_894', '12394_732', '12395_882', '12396_716',
        '12398_360', '12400_368', '12401_364', '12402_372', '12403_887', '12404_132', '12405_116',
        '12406_120', '12407_634', '12408_404', '12409_296', '12410_170', '12411_174', '12412_178',
        '12413_408', '12414_188', '12415_384', '12416_192', '12417_414', '12418_418', '12419_426',
        '12420_430', '12422_434', '12423_438', '12424_442', '12425_480', '12426_478', '12427_450',
        '12429_454', '12430_458', '12431_466', '12432_462', '12433_470', '12434_504', '12435_474',
        '12436_584', '12437_484', '12438_508', '12439_492', '12440_496', '12441_500', '12442_104',
        '12443_516', '12444_520', '12445_524', '12446_562', '12447_566', '12448_558', '12449_570',
        '12450_554', '12451_540', '12453_830', '12454_574', '12455_512', '12456_136', '12457_184',
        '12458_833', '12459_654', '12460_586', '12461_585', '12462_591', '12463_598', '12464_600',
        '12465_604', '12466_612', '12467_630', '12468_410', '12469_638', '12470_646', '12471_222',
        '12472_674', '12473_678', '12475_748', '12476_580', '12477_690', '12478_686', '12479_666',
        '12480_670', '12481_659', '12482_662', '12483_694', '12484_702', '12486_090', '12487_706',
        '12488_736', '12489_740', '12490_158', '12491_834', '12492_796', '12493_768', '12494_772',
        '12495_776', '12496_780', '12497_800', '12498_876', '12499_858', '12500_234', '12501_583',
        '12502_242', '12503_608', '12505_238', '12506_258', '12507_140', '12508_744', '12509_144',
        '12510_218', '12511_226', '12512_232', '12513_231', '12514_710', '12515_388', '12516_896',
        '12517_898', '12518_274', '12519_352', '18045_152', '19365_344', '78472_148'
    ];

    // Create jQuery selectors for each ID
    var elements = ids.reduce((acc, id) => {
        acc[id] = $(`#19_1017_${id}_1`);
        return acc;
    }, {});

    // Make specific fields read-only
    elements['11849_000'].prop("readonly", true);
    elements['11861_999'].prop("readonly", true);

    // Calculate sum for R999_C1
    var values_R999_C1 = ids
        .filter(id => id !== '11860_498' && id !== '11861_999')
        .map(id => parseInt(elements[id].val()) || 0);

    var sum_R999_C1 = values_R999_C1.reduce((acc, curr) => acc + curr, 0);
    elements['11861_999'].val(sum_R999_C1 === 0 ? "" : sum_R999_C1);

    // Calculate sum for R000_C1
    var values_R000_C1 = [
        parseInt(elements['11860_498'].val()) || 0,
        parseInt(elements['11861_999'].val()) || 0
    ];

    var sum_R000_C1 = values_R000_C1.reduce((acc, curr) => acc + curr, 0);
    elements['11849_000'].val(sum_R000_C1 === 0 ? "" : sum_R000_C1);
}