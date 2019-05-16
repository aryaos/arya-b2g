/* -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

/* DOM object for element.style */

#ifndef nsDOMCSSAttributeDeclaration_h
#define nsDOMCSSAttributeDeclaration_h

#include "mozilla/Attributes.h"
#include "nsDOMCSSDeclaration.h"

#include "nsAutoPtr.h"

namespace mozilla {
namespace dom {
class Element;
} // namespace dom
} // namespace mozilla

class nsDOMCSSAttributeDeclaration final : public nsDOMCSSDeclaration
{
public:
  typedef mozilla::dom::Element Element;
  nsDOMCSSAttributeDeclaration(Element* aContent);

  NS_DECL_CYCLE_COLLECTING_ISUPPORTS
  NS_DECL_CYCLE_COLLECTION_SKIPPABLE_SCRIPT_HOLDER_CLASS_AMBIGUOUS(nsDOMCSSAttributeDeclaration,
                                                                   nsICSSDeclaration)

  // If GetCSSDeclaration returns non-null, then the decl it returns
  // is owned by our current style rule.
  virtual mozilla::css::Declaration* GetCSSDeclaration(Operation aOperation) override;
  virtual void GetCSSParsingEnvironment(CSSParsingEnvironment& aCSSParseEnv) override;
  NS_IMETHOD GetParentRule(nsIDOMCSSRule **aParent) override;

  virtual nsINode* GetParentObject() override;

  NS_IMETHOD SetPropertyValue(const nsCSSProperty aPropID,
                              const nsAString& aValue) override;

protected:
  ~nsDOMCSSAttributeDeclaration();

  virtual nsresult SetCSSDeclaration(mozilla::css::Declaration* aDecl) override;
  virtual nsIDocument* DocToUpdate() override;

  RefPtr<Element> mElement;
};

#endif /* nsDOMCSSAttributeDeclaration_h */