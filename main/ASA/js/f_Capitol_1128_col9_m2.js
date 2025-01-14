var from = "";
$(document).ready(function () {
    // Initialize form variable
    from = $("#formDenShort").val();

    // Initial calculation
    f_Capitol_1128_col9_m2();
    f_Capitol_1128_col8_m2();
    f_Capitol_1128_col10_m2();
    // Attach event listener to all input fields initially present
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f_Capitol_1128_col9_m2();
        f_Capitol_1128_col8_m2();
        f_Capitol_1128_col10_m2();
    });

    // Use event delegation to handle dynamically added rows
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", function (e) {
        f_Capitol_1128_col9_m2();
        f_Capitol_1128_col8_m2();
        f_Capitol_1128_col10_m2();
    });
});




function f_Capitol_1128_col9_m2() {
    // Variable declarations for each row in column 9
    var R500_C9 = $("#64_1128_59030_500_9");
    var sum_R500_C9 = 0;

    // List of row IDs excluding 500
    var rowIDs = [
        510, 511, 512, 513, 514, 515, 516, 517, 518, 519,
        520, 521, 522, 523, 524, 525, 526, 527, 528, 529,
        530, 531, 532, 533, 534, 535, 536, 537, 538, 539,
        540, 541, 542, 543, 544, 545, 546, 547, 548, 549,
        550, 551, 552, 553, 554, 555, 556, 557, 558, 559,
        560, 561, 562, 563, 564, 565, 566, 567, 568, 569,
        570, 571, 572, 573, 574, 575, 576, 577, 578, 579,
        580, 581, 582, 583, 584, 585, 586, 587, 588, 589,
        590, 591, 592, 593, 594, 595, 596, 597, 598, 599,
        600, 601, 602, 603, 604, 605, 606, 607, 608, 609,
        610, 611, 612, 613, 614, 615, 616, 617, 618, 619,
        620, 621, 622, 623, 624, 625, 626, 627, 628, 629,
        630, 631, 632, 633, 634, 635, 636, 637, 638, 639,
        640, 641, 642, 643, 644, 645, 646, 647, 648, 649,
        650, 651, 652, 653, 654, 655, 656, 657, 658, 659,
        660, 661, 662, 663, 664, 665, 666, 667, 668, 669,
        670, 671, 672, 673, 674, 675, 676, 677, 678, 679,
        680, 681, 682, 683, 684, 685, 686, 687, 688, 689,
        690, 691, 692, 693, 694, 695, 696, 697, 698, 699,
        700, 701, 702, 703, 704, 705, 706, 707, 708, 709,
        710, 711, 712, 713, 714, 715, 716, 717, 718, 719,
        720, 721, 722, 723, 724, 725, 726, 727, 728, 729,
        730, 731, 732, 733, 734, 735, 736, 737, 738, 739,
        740, 741, 742, 743, 744, 745, 746, 747, 748, 749,
        750, 751, 752, 753, 754, 755, 756, 757, 758, 759,
        760, 761, 762, 763, 764, 765, 766, 767, 768, 769,
        770, 771, 772, 773, 774, 775, 776, 777, 778, 779,
        780, 781, 782, 783, 784, 785, 786, 787, 788, 789,
        790, 791, 792, 793, 794, 795, 796, 797, 798, 799,
        800, 801, 802, 803, 804, 805, 806, 807, 808, 809,
        810
    ];

    // Iterate over each row ID to compute the sum
    rowIDs.forEach(function (rowID) {
        var variable = $("#64_1128_" + getMDID(rowID) + "_" + rowID + "_9");
        var value = parseInt(variable.val()) || 0;
        sum_R500_C9 += value;
    });

    // Set R500_C9 to be readonly
    R500_C9.prop("readonly", true);

    // Update R500_C9 with the computed sum
    R500_C9.val(sum_R500_C9 === 0 ? "" : sum_R500_C9);
}

function f_Capitol_1128_col8_m2() {
    // Variable declarations for each row in column 9
    var R500_C8 = $("#64_1128_59030_500_8");
    var sum_R500_C8 = 0;

    // List of row IDs excluding 500
    var rowIDs = [
        510, 511, 512, 513, 514, 515, 516, 517, 518, 519,
        520, 521, 522, 523, 524, 525, 526, 527, 528, 529,
        530, 531, 532, 533, 534, 535, 536, 537, 538, 539,
        540, 541, 542, 543, 544, 545, 546, 547, 548, 549,
        550, 551, 552, 553, 554, 555, 556, 557, 558, 559,
        560, 561, 562, 563, 564, 565, 566, 567, 568, 569,
        570, 571, 572, 573, 574, 575, 576, 577, 578, 579,
        580, 581, 582, 583, 584, 585, 586, 587, 588, 589,
        590, 591, 592, 593, 594, 595, 596, 597, 598, 599,
        600, 601, 602, 603, 604, 605, 606, 607, 608, 609,
        610, 611, 612, 613, 614, 615, 616, 617, 618, 619,
        620, 621, 622, 623, 624, 625, 626, 627, 628, 629,
        630, 631, 632, 633, 634, 635, 636, 637, 638, 639,
        640, 641, 642, 643, 644, 645, 646, 647, 648, 649,
        650, 651, 652, 653, 654, 655, 656, 657, 658, 659,
        660, 661, 662, 663, 664, 665, 666, 667, 668, 669,
        670, 671, 672, 673, 674, 675, 676, 677, 678, 679,
        680, 681, 682, 683, 684, 685, 686, 687, 688, 689,
        690, 691, 692, 693, 694, 695, 696, 697, 698, 699,
        700, 701, 702, 703, 704, 705, 706, 707, 708, 709,
        710, 711, 712, 713, 714, 715, 716, 717, 718, 719,
        720, 721, 722, 723, 724, 725, 726, 727, 728, 729,
        730, 731, 732, 733, 734, 735, 736, 737, 738, 739,
        740, 741, 742, 743, 744, 745, 746, 747, 748, 749,
        750, 751, 752, 753, 754, 755, 756, 757, 758, 759,
        760, 761, 762, 763, 764, 765, 766, 767, 768, 769,
        770, 771, 772, 773, 774, 775, 776, 777, 778, 779,
        780, 781, 782, 783, 784, 785, 786, 787, 788, 789,
        790, 791, 792, 793, 794, 795, 796, 797, 798, 799,
        800, 801, 802, 803, 804, 805, 806, 807, 808, 809,
        810
    ];

    // Iterate over each row ID to compute the sum
    rowIDs.forEach(function (rowID) {
        var variable = $("#64_1128_" + getMDID(rowID) + "_" + rowID + "_8");
        var value = parseFloat(variable.val()) || 0.0;
        sum_R500_C8 += value;
    });

    // Set R500_C9 to be readonly
    R500_C8.prop("readonly", true);

    // Update R500_C9 with the computed sum
    R500_C8.val(sum_R500_C8 === 0 ? "" : sum_R500_C8.toFixed(1));
}

function f_Capitol_1128_col10_m2() {
    // Variable declarations for each row in column 9
    var R500_C10 = $("#64_1128_59030_500_10");
    var sum_R500_C10 = 0;

    // List of row IDs excluding 500
    var rowIDs = [
        510, 511, 512, 513, 514, 515, 516, 517, 518, 519,
        520, 521, 522, 523, 524, 525, 526, 527, 528, 529,
        530, 531, 532, 533, 534, 535, 536, 537, 538, 539,
        540, 541, 542, 543, 544, 545, 546, 547, 548, 549,
        550, 551, 552, 553, 554, 555, 556, 557, 558, 559,
        560, 561, 562, 563, 564, 565, 566, 567, 568, 569,
        570, 571, 572, 573, 574, 575, 576, 577, 578, 579,
        580, 581, 582, 583, 584, 585, 586, 587, 588, 589,
        590, 591, 592, 593, 594, 595, 596, 597, 598, 599,
        600, 601, 602, 603, 604, 605, 606, 607, 608, 609,
        610, 611, 612, 613, 614, 615, 616, 617, 618, 619,
        620, 621, 622, 623, 624, 625, 626, 627, 628, 629,
        630, 631, 632, 633, 634, 635, 636, 637, 638, 639,
        640, 641, 642, 643, 644, 645, 646, 647, 648, 649,
        650, 651, 652, 653, 654, 655, 656, 657, 658, 659,
        660, 661, 662, 663, 664, 665, 666, 667, 668, 669,
        670, 671, 672, 673, 674, 675, 676, 677, 678, 679,
        680, 681, 682, 683, 684, 685, 686, 687, 688, 689,
        690, 691, 692, 693, 694, 695, 696, 697, 698, 699,
        700, 701, 702, 703, 704, 705, 706, 707, 708, 709,
        710, 711, 712, 713, 714, 715, 716, 717, 718, 719,
        720, 721, 722, 723, 724, 725, 726, 727, 728, 729,
        730, 731, 732, 733, 734, 735, 736, 737, 738, 739,
        740, 741, 742, 743, 744, 745, 746, 747, 748, 749,
        750, 751, 752, 753, 754, 755, 756, 757, 758, 759,
        760, 761, 762, 763, 764, 765, 766, 767, 768, 769,
        770, 771, 772, 773, 774, 775, 776, 777, 778, 779,
        780, 781, 782, 783, 784, 785, 786, 787, 788, 789,
        790, 791, 792, 793, 794, 795, 796, 797, 798, 799,
        800, 801, 802, 803, 804, 805, 806, 807, 808, 809,
        810
    ];

    // Iterate over each row ID to compute the sum
    rowIDs.forEach(function (rowID) {
        var variable = $("#64_1128_" + getMDID(rowID) + "_" + rowID + "_10");
        var value = parseFloat(variable.val()) || 0.0;
        sum_R500_C10 += value;
    });

    // Set R500_C9 to be readonly
    R500_C10.prop("readonly", true);

    // Update R500_C9 with the computed sum
    R500_C10.val(sum_R500_C10 === 0 ? "" : sum_R500_C10.toFixed(1));
}

// Modify getMDID   
// Complete mapping for MDID based on rowID
function getMDID(rowID) {
    var mdidMapping = {
        510: "59032", 511: "59033", 512: "59034", 513: "59035", 514: "59036",
        515: "59037", 516: "59038", 517: "59039", 518: "59040", 519: "59041",
        520: "59042", 521: "59043", 522: "59044", 523: "59045", 524: "59046",
        525: "59047", 526: "59048", 527: "59049", 528: "59050", 529: "59051",
        530: "59052", 531: "59053", 532: "59054", 533: "59055", 534: "59056",
        535: "59057", 536: "59058", 537: "59059", 538: "59060", 539: "59061",
        540: "59062", 541: "59063", 542: "59064", 543: "59065", 544: "59066",
        545: "59067", 546: "59068", 547: "59069", 548: "59070", 549: "59071",
        550: "59072", 551: "59073", 552: "59074", 553: "59075", 554: "59076",
        555: "59077", 556: "59078", 557: "59079", 558: "59080", 559: "59081",
        560: "59082", 561: "59083", 562: "59084", 563: "59085", 564: "59086",
        565: "59087", 566: "59088", 567: "59089", 568: "59090", 569: "59091",
        570: "59092", 571: "59093", 572: "59094", 573: "59095", 574: "59096",
        575: "59097", 576: "59098", 577: "59099", 578: "59100", 579: "59101",
        580: "59102", 581: "59103", 582: "59104", 583: "59105", 584: "59106",
        585: "59107", 586: "59108", 587: "59109", 588: "59110", 589: "59111",
        590: "59112", 591: "59113", 592: "59114", 593: "59115", 594: "59116",
        595: "59117", 596: "59118", 597: "59119", 598: "59120", 599: "59121",
        600: "59122", 601: "59123", 602: "59124", 603: "59125", 604: "59126",
        605: "59127", 606: "59128", 607: "59129", 608: "59130", 609: "59131",
        610: "59132", 611: "59133", 612: "59134", 613: "59135", 614: "59136",
        615: "59137", 616: "59138", 617: "59139", 618: "59140", 619: "59141",
        620: "59142", 621: "59143", 622: "59144", 623: "59145", 624: "59146",
        625: "59147", 626: "59148", 627: "59149", 628: "59150", 629: "59151",
        
        630: "59152", 631: "59153", 632: "59154", 633: "59155", 634: "59156",
        635: "59157", 636: "59158", 637: "59159", 638: "59160", 639: "59161",
        640: "59162", 641: "59163", 642: "59164", 643: "59165", 644: "59166",
        645: "59167", 646: "59168", 647: "59169", 648: "59170", 649: "59171",
        650: "59172", 651: "59173", 652: "59174", 653: "59175", 654: "59176",
        655: "59177", 656: "59178", 657: "59179", 658: "59180", 659: "59181",
        660: "59182", 661: "59183", 662: "59184", 663: "59185", 664: "59186",
        665: "59187", 666: "59188", 667: "59189", 668: "59190", 669: "59191",
        670: "59192", 671: "59193", 672: "59194", 673: "59195", 674: "59196",
        675: "59197", 676: "59198", 677: "59199", 678: "59200", 679: "59201",
        680: "59202", 681: "59203", 682: "59204", 683: "59205", 684: "59206",
        685: "59207", 686: "59208", 687: "59209", 688: "59210", 689: "59211",
        690: "59212", 691: "59213", 692: "59214", 693: "59215", 694: "59216",
        695: "59217", 696: "59218", 697: "59219", 698: "59220", 699: "59221",
        700: "59222", 701: "59223", 702: "59224", 703: "59225", 704: "59226",
        705: "59227", 706: "59228", 707: "59229", 708: "59230", 709: "59231",
        710: "59232", 711: "59233", 712: "59234", 713: "59235", 714: "59236",
        715: "59237", 716: "59238", 717: "59239", 718: "59240", 719: "59241",
        720: "59242", 721: "59243", 722: "59244", 723: "59245", 724: "59246",
        725: "59247", 726: "59248", 727: "59249", 728: "59250", 729: "59251",
        730: "59252", 731: "59253", 732: "59254", 733: "59255", 734: "59256",
        735: "59257", 736: "59258", 737: "59259", 738: "59260", 739: "59261",
        740: "59262", 741: "59263", 742: "59264", 743: "59265", 744: "59266",
        745: "59267", 746: "59268", 747: "59269", 748: "59270", 749: "59271",
        750: "59272", 751: "59273", 752: "59274", 753: "59275", 754: "59276",
        755: "59277", 756: "59278", 757: "59279", 758: "59280", 759: "59281",
        760: "59282", 761: "59283", 762: "59284", 763: "59285", 764: "59286",
        765: "59287", 766: "59288", 767: "59289", 768: "59290", 769: "59291",
        770: "59292", 771: "59293", 772: "59294", 773: "59295", 774: "59296",
        775: "59297", 776: "59298", 777: "59299", 778: "59300", 779: "59301",
        780: "59302", 781: "59303", 782: "59304", 783: "59305", 784: "59306",
        785: "59307", 786: "59308", 787: "59309", 788: "59310", 789: "59311",
        790: "59312", 791: "59313", 792: "59314", 793: "59315", 794: "59316",
        795: "59317", 796: "59318", 797: "59319", 798: "59320", 799: "59321",
        800: "59322", 801: "59323", 802: "59324", 803: "59325", 804: "59326",
        805: "59327", 806: "59328", 807: "59329", 808: "61829", 809: "61830",
        810: "61831"
    };
    return mdidMapping[rowID] || "UNKNOWN_MDID";
}

