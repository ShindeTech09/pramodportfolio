import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramod_portfolio/constants/string_values.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class EventGalleryPage extends StatelessWidget {
  const EventGalleryPage({
    super.key,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetValues.appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Event Gallery',
                  style: GoogleFonts.abhayaLibre(fontSize: 50.0),
                ),
                const Gap(20.0),
                GridView.builder(
                  shrinkWrap:
                      true, // Ensures GridView takes only the required height
                  physics:
                      const NeverScrollableScrollPhysics(), // Prevents GridView from scrolling
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 30.0,
                  ),
                  itemCount: StringValues.imageList.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child:
                        // Image.network(
                        //   StringValues
                        //       .imageList[index], // Use the correct index
                        //   fit: BoxFit.cover,
                        //   loadingBuilder: (context, child, loadingProgress) {
                        //     if (loadingProgress == null) return child;
                        //     return const Center(
                        //       child: CircularProgressIndicator(),
                        //     );
                        //   },
                        //   errorBuilder: (context, error, stackTrace) {
                        //     return const Center(
                        //       child: Icon(
                        //         Icons.broken_image,
                        //         size: 50,
                        //         color: Colors.grey,
                        //       ),
                        //     );
                        //   },
                        // ),
                        CachedNetworkImage(
                          imageUrl: StringValues.imageList[index],
                          progressIndicatorBuilder: (context, url, progress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Text(
                                '🙏',
                                style: TextStyle(fontSize: 30.0),
                              ),
                            );
                          },
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
