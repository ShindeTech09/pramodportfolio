import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pramod_portfolio/constants/widget_values.dart';

class GalleryPageTemplate extends StatelessWidget {
  const GalleryPageTemplate({
    super.key,
    required this.pageTitle,
    required this.imageList,
  });

  final String pageTitle;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetValues.appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap((screenWidth > 1024 ? 180 : 140)),
                Text(pageTitle, style: GoogleFonts.abhayaLibre(fontSize: 50.0)),
                // const Gap(20.0),
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
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                          imageUrl: imageList[index],
                          progressIndicatorBuilder: (context, url, progress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Image.network(
                                  imageList[index], // Use the correct index
                                  fit: BoxFit.contain,
                                  loadingBuilder: (
                                    context,
                                    child,
                                    loadingProgress,
                                  ) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
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
