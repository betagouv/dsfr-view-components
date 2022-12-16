require 'spec_helper'

RSpec.describe(DsfrLinkHelper, type: 'helper') do
  include ActionView::Helpers::UrlHelper
  include ActionView::Context

  let(:text) { 'Menu' }
  let(:url) { '/stuff/menu/' }
  let(:args) { [text, url] }
  let(:kwargs) { {} }

  describe "dsfr_link_to" do
    context "when given a block" do
      let(:link) { dsfr_link_to(url, { class: 'foobar' }) { text } }

      it "behaves like Rails's link_to" do
        expect(link).to have_tag(:a, text: text, with: { href: url })
      end
    end

    context "when given three arguments" do
      let(:link) { dsfr_link_to(text, url, { class: 'foobar' }) }

      it "behaves like Rails's link_to" do
        expect(link).to have_tag(:a, text: text, with: { href: url })
      end
    end
  end

  it "has a default class of `fr-link`" do
    expect(dsfr_link_to(text, url)).to have_tag :a, with: { class: 'fr-link' }
  end

  describe "icons" do
    %w[left right].each do |direction|
      it "understands a #{direction}_icon property" do
        link = dsfr_link_to(text, url, "icon_#{direction}" => 'foobar')

        expect(link).to have_tag :a, with: { class: ['fr-link', "fr-link--icon-#{direction}"] }
      end
    end

    it "removes the icon property off the final markup" do
      link = dsfr_link_to(text, url, icon_left: 'foobar')

      expect(link).not_to have_tag :a, with: { icon_left: 'foobar' }
    end
  end

  describe "sizing" do
    %w[sm lg].each do |size|
      it "understands a '#{size}' size" do
        link = dsfr_link_to(text, url, size: size)

        expect(link).to have_tag :a, with: { class: "fr-link--#{size}" }
      end

      it "removes the size property off the final markup" do
        link = dsfr_link_to(text, url, size: 'sm')

        expect(link).not_to have_tag :a, with: { size: 'sm' }
      end
    end
  end
end
