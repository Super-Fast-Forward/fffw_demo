import 'package:fffw_demo/core/shared_widgets/code_layout.dart';
import 'package:fffw_demo/core/shared_widgets/page_layout.dart';
import 'package:fffw_demo/core/shared_widgets/section_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SandboxPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageLayout(title: 'Sandbox', sections: [
      SectionLayout(
        children: [
          Text('Expanded/Flexible exceptions',
              style: Theme.of(context).textTheme.titleLarge),
          Text(
              "Expanded and Flexible widgets are great for building layouts, but they should be used "
              "with care. They are very powerful, but they can also be tricky to use correctly. "
              "If you are not careful, you can end up with a layout that is difficult to debug.\n"
              "Things to remember when using Flexible and Expanded:\n"
              "An [Expanded] widget must be a descendant of a [Row], [Column], or [Flex],\n"
              "and the path from the [Expanded] widget to its enclosing [Row], [Column], or\n"
              "[Flex] must contain only [StatelessWidget]s or [StatefulWidget]s (not other\n"
              "kinds of widgets, like [RenderObjectWidget]s).\n"
              "https://www.youtube.com/watch?v=_rnZaagadyo"),
          Text(
              "══╡ EXCEPTION CAUGHT BY WIDGETS LIBRARY ╞═══════════════════════════════════════════════════════════\n"
              "The following assertion was thrown while looking for parent data.:\n"
              "Incorrect use of ParentDataWidget.\n"
              "The following ParentDataWidgets are providing parent data to the same RenderObject:\n"
              "2\n"
              "- Expanded(flex: 1) (typically placed directly inside a Flex widget)\n"
              "However, a RenderObject can only receive parent data from at most one ParentDataWidget.\n"
              "Usually, this indicates that at least one of the offending ParentDataWidgets listed above is not\n"
              "placed directly inside a compatible ancestor widget.\n"
              "The ownership chain for the RenderObject that received the parent data was:\n"
              "  SizedBox.shrink ← Expanded ← Spacer ← Expanded ← Row ← _AppBarTitleBox ← Semantics ←\n"
              "DefaultTextStyle ← MediaQuery ← LayoutId-[<_ToolbarSlot.middle>] ← ⋯\n"
              "When the exception was thrown, this was the stack:\n"
              "dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:49      throw_\n"
              "packages/flutter/src/widgets/framework.dart 5792:11                               <fn>\n"
              "packages/flutter/src/widgets/framework.dart 5805:14                               [_findAncestorParentDataElement]\n"
              "packages/flutter/src/widgets/framework.dart 6157:62                               attachRenderObject\n"
              "..."),
          Text('Solution:', style: Theme.of(context).textTheme.titleLarge),
          Text(
              '1. Try to look at the stack trace and understand widgets chain. This will tell you where the problem originated. \n'
              '2. Try to comment out offending/suspected widgets (from the chain). \n'
              '3. If it helped, look at the widgets and find where Flexible/Expanded was placed wrongly. \n'),
          Text('Code Example:', style: Theme.of(context).textTheme.titleMedium),

          Text('It matters what you are trying to put inside Flexible/Expanded'
              'For example, the following code will throw an exception:'),

// Row(
//               children: [
//                   Expanded(child: Spacer()),
//               ],
//             )

          CodeLayout("""Row()"""
              """  children: ["""
              """    Expanded(child: Spacer()),"""
              """  ],"""
              """)"""),
        ],
      ),
      SectionLayout(children: [
        Text('Expanded/Flexible exceptions',
            style: Theme.of(context).textTheme.titleLarge),
        Text(
//           Error: Cannot hit test a render box that has never been laid out.
// dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:49      throw_
// packages/flutter/src/rendering/box.dart 2490:11                                   <fn>
// packages/flutter/src/rendering/box.dart 2520:14                                   hitTest
// packages/flutter/src/rendering/box.dart 2903:23                                   <fn>
// packages/flutter/src/rendering/box.dart 810:31                                    addWithPaintOffset
// packages/flutter/src/rendering/box.dart 2898:32                                   defaultHitTestChildren
// packages/flutter/src/rendering/custom_layout.dart 420:12                          hitTestChildren
            "Error: Cannot hit test a render box that has never been laid out.\n"
            "dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:49      throw_\n"
            "packages/flutter/src/rendering/box.dart 2490:11                                   <fn>\n"
            "packages/flutter/src/rendering/box.dart 2520:14                                   hitTest\n"
            "packages/flutter/src/rendering/box.dart 2903:23                                   <fn>\n"
            "packages/flutter/src/rendering/box.dart 810:31                                    addWithPaintOffset\n"
            "packages/flutter/src/rendering/box.dart 2898:32                                   defaultHitTestChildren\n"
            "packages/flutter/src/rendering/custom_layout.dart 420:12                          hitTestChildren\n")
      ])
    ]);
  }
}