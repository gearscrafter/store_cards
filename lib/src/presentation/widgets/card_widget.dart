import 'package:flutter/material.dart';
import '../../domain/entities/card_entity.dart';

class CardWidget extends StatelessWidget {
  final CardEntity card;
  final double scale;
  final double animationValue;
  final Function()? onPressed;

  const CardWidget(
      {super.key,
      this.animationValue = 0.0,
      this.onPressed,
      required this.card,
      required this.scale});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200 * scale,
      width: double.infinity,
      child: Stack(
        children: [
          Card(
            color: Color(int.parse('0xff${card.color}')),
            margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30 * scale,
                        width: 30 * scale,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(card.imageUrl ?? '',
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        // Agrega un Expanded aquí
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card.title,
                              style: TextStyle(
                                  fontSize: 14 * scale,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              card.description,
                              style: TextStyle(
                                  fontSize: 10 * scale,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  (animationValue == 0)
                      ? const SizedBox.shrink()
                      : SizedBox(
                          height: 8 * animationValue,
                        ),
                  (animationValue == 0)
                      ? const SizedBox.shrink()
                      : Opacity(
                          opacity: animationValue,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$ ${card.amount}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 36),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 150,
                                    ),
                                    child: Text(
                                      'Recaudado en esta tienda hasta ahora',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10 + (4 * animationValue)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5 * animationValue,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                  const Expanded(child: SizedBox()),
                  Column(
                    children: [
                      (animationValue > 0.9)
                          ? Text(
                              'Escanea este código antes de pagar.',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 1 + (15 * animationValue)),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 5 * animationValue,
                      ),
                      Container(
                        height: 30 * scale,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(card.barcode ?? '',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          (animationValue == 0)
              ? const SizedBox.shrink()
              : Positioned(
                  right: 20,
                  top: 20,
                  child: GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      child: const Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          Text(
                            'Editar',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
